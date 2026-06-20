// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'waste_offer_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PickupWindow _$PickupWindowFromJson(Map<String, dynamic> json) =>
    _PickupWindow(
      start: const TimestampConverter().fromJson(json['start'] as Timestamp),
      end: const TimestampConverter().fromJson(json['end'] as Timestamp),
    );

Map<String, dynamic> _$PickupWindowToJson(_PickupWindow instance) =>
    <String, dynamic>{
      'start': const TimestampConverter().toJson(instance.start),
      'end': const TimestampConverter().toJson(instance.end),
    };

_WasteOfferModel _$WasteOfferModelFromJson(Map<String, dynamic> json) =>
    _WasteOfferModel(
      id: json['id'] as String,
      generatorId: json['generatorId'] as String,
      generatorLocation: GeoLocation.fromJson(
        json['generatorLocation'] as Map<String, dynamic>,
      ),
      category: json['category'] as String,
      estimatedQuantityKg: (json['estimatedQuantityKg'] as num).toDouble(),
      photos: (json['photos'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      canTransportSelf: json['canTransportSelf'] as bool? ?? false,
      status: json['status'] as String,
      createdAt: const TimestampConverter().fromJson(
        json['createdAt'] as Timestamp,
      ),
      preferredPickupWindow: PickupWindow.fromJson(
        json['preferredPickupWindow'] as Map<String, dynamic>,
      ),
      matchedCompanyId: json['matchedCompanyId'] as String?,
    );

Map<String, dynamic> _$WasteOfferModelToJson(_WasteOfferModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'generatorId': instance.generatorId,
      'generatorLocation': instance.generatorLocation,
      'category': instance.category,
      'estimatedQuantityKg': instance.estimatedQuantityKg,
      'photos': instance.photos,
      'canTransportSelf': instance.canTransportSelf,
      'status': instance.status,
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
      'preferredPickupWindow': instance.preferredPickupWindow,
      'matchedCompanyId': instance.matchedCompanyId,
    };
