// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dispute_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DisputeModel _$DisputeModelFromJson(Map<String, dynamic> json) =>
    _DisputeModel(
      id: json['id'] as String,
      transactionId: json['transactionId'] as String,
      raisedBy: json['raisedBy'] as String,
      reason: json['reason'] as String,
      evidence: (json['evidence'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      status: json['status'] as String,
      resolutionNotes: json['resolutionNotes'] as String?,
    );

Map<String, dynamic> _$DisputeModelToJson(_DisputeModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'transactionId': instance.transactionId,
      'raisedBy': instance.raisedBy,
      'reason': instance.reason,
      'evidence': instance.evidence,
      'status': instance.status,
      'resolutionNotes': instance.resolutionNotes,
    };
