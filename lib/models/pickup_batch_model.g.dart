// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pickup_batch_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BatchStop _$BatchStopFromJson(Map<String, dynamic> json) => _BatchStop(
  offerId: json['offerId'] as String,
  sequenceOrder: (json['sequenceOrder'] as num).toInt(),
  estimatedArrival: const NullableTimestampConverter().fromJson(
    json['estimatedArrival'] as Timestamp?,
  ),
);

Map<String, dynamic> _$BatchStopToJson(_BatchStop instance) =>
    <String, dynamic>{
      'offerId': instance.offerId,
      'sequenceOrder': instance.sequenceOrder,
      'estimatedArrival': const NullableTimestampConverter().toJson(
        instance.estimatedArrival,
      ),
    };

_PickupBatchModel _$PickupBatchModelFromJson(Map<String, dynamic> json) =>
    _PickupBatchModel(
      id: json['id'] as String,
      companyId: json['companyId'] as String,
      driverId: json['driverId'] as String?,
      scheduledWindow: PickupWindow.fromJson(
        json['scheduledWindow'] as Map<String, dynamic>,
      ),
      stops: (json['stops'] as List<dynamic>)
          .map((e) => BatchStop.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: json['status'] as String,
    );

Map<String, dynamic> _$PickupBatchModelToJson(_PickupBatchModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'companyId': instance.companyId,
      'driverId': instance.driverId,
      'scheduledWindow': instance.scheduledWindow,
      'stops': instance.stops,
      'status': instance.status,
    };
