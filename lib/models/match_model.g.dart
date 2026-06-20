// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'match_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MatchModel _$MatchModelFromJson(Map<String, dynamic> json) => _MatchModel(
  id: json['id'] as String,
  offerId: json['offerId'] as String,
  companyId: json['companyId'] as String,
  generatorId: json['generatorId'] as String,
  proposedAt: const TimestampConverter().fromJson(
    json['proposedAt'] as Timestamp,
  ),
  matchScore: (json['matchScore'] as num).toDouble(),
  scoreBreakdown: (json['scoreBreakdown'] as Map<String, dynamic>).map(
    (k, e) => MapEntry(k, (e as num).toDouble()),
  ),
  transportDecision: json['transportDecision'] as String,
  batchId: json['batchId'] as String?,
  status: json['status'] as String,
);

Map<String, dynamic> _$MatchModelToJson(_MatchModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'offerId': instance.offerId,
      'companyId': instance.companyId,
      'generatorId': instance.generatorId,
      'proposedAt': const TimestampConverter().toJson(instance.proposedAt),
      'matchScore': instance.matchScore,
      'scoreBreakdown': instance.scoreBreakdown,
      'transportDecision': instance.transportDecision,
      'batchId': instance.batchId,
      'status': instance.status,
    };
