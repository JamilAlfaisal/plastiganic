// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fraud_flag_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FraudFlagModel _$FraudFlagModelFromJson(Map<String, dynamic> json) =>
    _FraudFlagModel(
      id: json['id'] as String,
      targetType: json['targetType'] as String,
      targetId: json['targetId'] as String,
      reason: json['reason'] as String,
      signalScore: (json['signalScore'] as num).toDouble(),
      reviewedBy: json['reviewedBy'] as String?,
      status: json['status'] as String? ?? 'open',
    );

Map<String, dynamic> _$FraudFlagModelToJson(_FraudFlagModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'targetType': instance.targetType,
      'targetId': instance.targetId,
      'reason': instance.reason,
      'signalScore': instance.signalScore,
      'reviewedBy': instance.reviewedBy,
      'status': instance.status,
    };
