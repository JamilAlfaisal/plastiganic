import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/config/app_config.dart';
import '../../../models/waste_offer_model.dart';

/// Stream of all waste offers for a specific generator, ordered newest first.
final generatorOffersProvider =
    StreamProvider.family<List<WasteOfferModel>, String>((ref, uid) {
  return FirebaseFirestore.instance
      .collection(AppConfig.wasteOffersCollection)
      .where('generatorId', isEqualTo: uid)
      .orderBy('createdAt', descending: true)
      .snapshots()
      .map((snap) => snap.docs
          .map((d) => WasteOfferModel.fromJson({...d.data(), 'id': d.id}))
          .toList());
});

/// Stream of all open offers globally (used by company matching inbox).
final openOffersStreamProvider = StreamProvider<List<WasteOfferModel>>((ref) {
  return FirebaseFirestore.instance
      .collection(AppConfig.wasteOffersCollection)
      .where('status', isEqualTo: 'open')
      .orderBy('createdAt', descending: true)
      .snapshots()
      .map((snap) => snap.docs
          .map((d) => WasteOfferModel.fromJson({...d.data(), 'id': d.id}))
          .toList());
});
