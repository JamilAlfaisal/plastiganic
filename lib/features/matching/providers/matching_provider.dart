import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geoflutterfire_plus/geoflutterfire_plus.dart';
import '../../../core/config/app_config.dart';
import '../../../models/company_profile_model.dart';
import '../../../models/match_model.dart';
import '../../../models/waste_offer_model.dart';

/// Weights used in the matching score calculation (must sum to ~1.0).
const _kDistanceWeight = 0.40;
const _kPriceWeight = 0.30;
const _kDriverWeight = 0.15;
const _kCategoryWeight = 0.15;

/// Radius in km for the initial geo query (narrows Firestore reads).
const _kSearchRadiusKm = 30.0;

/// Maximum number of top matches written to Firestore.
const _kMaxMatches = 5;

/// Computes a normalised [0, 1] match score for a company against an offer.
MatchScoreBreakdown scoreCompany({
  required CompanyProfileModel company,
  required WasteOfferModel offer,
  required double distanceKm,
  required double avgMarketPricePerKg,
}) {
  // ── Distance score ─────────────────────────────────────────────────────────
  // 0 km → 1.0, at or beyond radius → 0.0
  final distanceScore = (1.0 - (distanceKm / _kSearchRadiusKm)).clamp(0.0, 1.0);

  // ── Price score ───────────────────────────────────────────────────────────
  // Compare company price to average market price — lower is better for generator.
  double priceScore = 0.5; // Default neutral when no price data
  final priceEntry = company.pricePerUnit[offer.category];
  if (priceEntry != null && avgMarketPricePerKg > 0) {
    final companyPriceKg = priceEntry.amount;
    priceScore = (avgMarketPricePerKg / (companyPriceKg + 1.0)).clamp(0.0, 1.0);
  }

  // ── Driver availability score ──────────────────────────────────────────────
  // If generator can't transport, having a driver is critical; else neutral.
  double driverScore;
  if (!offer.canTransportSelf) {
    driverScore = company.hasDrivers ? 1.0 : 0.0;
  } else {
    driverScore = company.hasDrivers ? 0.8 : 0.6; // Both are fine
  }

  // ── Category overlap score ─────────────────────────────────────────────────
  final categoryScore = company.acceptedCategories.contains(offer.category) ? 1.0 : 0.0;

  final total = distanceScore * _kDistanceWeight
      + priceScore * _kPriceWeight
      + driverScore * _kDriverWeight
      + categoryScore * _kCategoryWeight;

  return MatchScoreBreakdown(
    distance: distanceScore,
    price: priceScore,
    driver: driverScore,
    category: categoryScore,
    total: total,
  );
}

class MatchScoreBreakdown {
  final double distance;
  final double price;
  final double driver;
  final double category;
  final double total;

  const MatchScoreBreakdown({
    required this.distance,
    required this.price,
    required this.driver,
    required this.category,
    required this.total,
  });

  Map<String, double> toMap() => {
    'distance': distance,
    'price': price,
    'driver': driver,
    'category': category,
  };
}

/// Runs the full matching pipeline for [offer] written by [generatorId].
/// Returns the list of [MatchModel] documents that were written to Firestore.
Future<List<MatchModel>> runMatchingForOffer({
  required WasteOfferModel offer,
  required String generatorId,
  required FirebaseFirestore firestore,
}) async {
  final offerGeo = offer.generatorLocation;
  final center = GeoFirePoint(GeoPoint(
    offerGeo.geopoint.latitude,
    offerGeo.geopoint.longitude,
  ));

  // Geo-query: find companies within radius whose profile is approved
  final collectionRef = firestore.collection(AppConfig.companyProfilesCollection);
  final stream = GeoCollectionReference<Map<String, dynamic>>(collectionRef).subscribeWithin(
    center: center,
    radiusInKm: _kSearchRadiusKm,
    field: 'location',
    geopointFrom: (data) {
      final loc = data['location'] as Map<String, dynamic>;
      final gp = loc['geopoint'] as GeoPoint;
      return gp;
    },
    strictMode: true,
  );

  final snapshot = await stream.first;

  final companies = snapshot
      .where((doc) => doc.exists && (doc.data()!['isApproved'] == true))
      .map((doc) {
        try {
          return CompanyProfileModel.fromJson({...doc.data()!, 'id': doc.id});
        } catch (_) {
          return null;
        }
      })
      .whereType<CompanyProfileModel>()
      .where((c) => c.acceptedCategories.contains(offer.category))
      .where((c) => (c.minWeightKg) <= offer.estimatedQuantityKg)
      .toList();

  if (companies.isEmpty) return [];

  // Score all candidates
  const avgMarketPrice = AppConfig.defaultAvgMarketPricePerKg;

  final scored = companies.map((company) {
    // Use the company's stored lat/lng (already embedded in profile)
    final compLoc = company.location;
    final compGp = compLoc.geopoint;
    final distKm = center.distanceBetweenInKm(
      geopoint: GeoPoint(compGp.latitude, compGp.longitude),
    );
    final breakdown = scoreCompany(
      company: company,
      offer: offer,
      distanceKm: distKm,
      avgMarketPricePerKg: avgMarketPrice,
    );
    return (company: company, breakdown: breakdown, distKm: distKm);
  }).toList()
    ..sort((a, b) => b.breakdown.total.compareTo(a.breakdown.total));

  final topN = scored.take(_kMaxMatches).toList();

  // Write match documents to Firestore
  final batch = firestore.batch();
  final matches = <MatchModel>[];

  for (final candidate in topN) {
    final matchRef = firestore.collection(AppConfig.matchesCollection).doc();
    final match = MatchModel(
      id: matchRef.id,
      offerId: offer.id,
      companyId: candidate.company.id,
      generatorId: generatorId,
      proposedAt: DateTime.now(),
      matchScore: candidate.breakdown.total,
      scoreBreakdown: candidate.breakdown.toMap(),
      status: 'proposed',
      transportDecision: offer.canTransportSelf ? 'generatorDelivers' : 'companyPickup',
    );
    batch.set(matchRef, match.toJson());
    matches.add(match);
  }

  await batch.commit();
  return matches;
}

/// Provider: watches matches for a specific offer (generator side)
final offerMatchesProvider = StreamProvider.family<List<MatchModel>, String>((ref, offerId) {
  final firestore = FirebaseFirestore.instance;
  return firestore
      .collection(AppConfig.matchesCollection)
      .where('offerId', isEqualTo: offerId)
      .snapshots()
      .map((snap) => snap.docs
          .map((doc) => MatchModel.fromJson({...doc.data(), 'id': doc.id}))
          .toList());
});

/// Provider: watches pending matches for a company (company side)
final companyPendingMatchesProvider = StreamProvider.family<List<MatchModel>, String>((ref, companyId) {
  final firestore = FirebaseFirestore.instance;
  return firestore
      .collection(AppConfig.matchesCollection)
      .where('companyId', isEqualTo: companyId)
      .where('status', isEqualTo: 'proposed')
      .snapshots()
      .map((snap) => snap.docs
          .map((doc) => MatchModel.fromJson({...doc.data(), 'id': doc.id}))
          .toList());
});
