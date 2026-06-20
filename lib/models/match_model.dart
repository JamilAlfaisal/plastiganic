import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'firestore_converters.dart';

part 'match_model.freezed.dart';
part 'match_model.g.dart';

@freezed
abstract class MatchModel with _$MatchModel {
  const factory MatchModel({
    required String id,
    required String offerId,
    required String companyId,
    required String generatorId,
    @TimestampConverter() required DateTime proposedAt,
    required double matchScore,
    required Map<String, double> scoreBreakdown, // 'distance', 'price', 'driver', 'category'
    required String transportDecision, // 'generatorDelivers' | 'companyPickup' | 'batchedPickup'
    String? batchId,
    required String status, // 'proposed' | 'accepted' | 'declined' | 'expired'
  }) = _MatchModel;

  factory MatchModel.fromJson(Map<String, dynamic> json) => _$MatchModelFromJson(json);
}
