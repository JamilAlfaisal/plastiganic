// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TransactionModel _$TransactionModelFromJson(
  Map<String, dynamic> json,
) => _TransactionModel(
  id: json['id'] as String,
  matchId: json['matchId'] as String,
  generatorId: json['generatorId'] as String,
  companyId: json['companyId'] as String,
  category: json['category'] as String,
  finalWeightKg: (json['finalWeightKg'] as num).toDouble(),
  agreedPrice: PriceDetail.fromJson(
    json['agreedPrice'] as Map<String, dynamic>,
  ),
  generatorConfirmedWeight: (json['generatorConfirmedWeight'] as num?)
      ?.toDouble(),
  companyConfirmedWeight: (json['companyConfirmedWeight'] as num?)?.toDouble(),
  generatorConfirmedPhotos: (json['generatorConfirmedPhotos'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  companyConfirmedPhotos: (json['companyConfirmedPhotos'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  status: json['status'] as String,
  recordedAt: const TimestampConverter().fromJson(
    json['recordedAt'] as Timestamp,
  ),
);

Map<String, dynamic> _$TransactionModelToJson(_TransactionModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'matchId': instance.matchId,
      'generatorId': instance.generatorId,
      'companyId': instance.companyId,
      'category': instance.category,
      'finalWeightKg': instance.finalWeightKg,
      'agreedPrice': instance.agreedPrice,
      'generatorConfirmedWeight': instance.generatorConfirmedWeight,
      'companyConfirmedWeight': instance.companyConfirmedWeight,
      'generatorConfirmedPhotos': instance.generatorConfirmedPhotos,
      'companyConfirmedPhotos': instance.companyConfirmedPhotos,
      'status': instance.status,
      'recordedAt': const TimestampConverter().toJson(instance.recordedAt),
    };
