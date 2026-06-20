import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'firestore_converters.dart';
import 'user_model.dart'; // For GeoLocation

part 'waste_offer_model.freezed.dart';
part 'waste_offer_model.g.dart';

@freezed
abstract class PickupWindow with _$PickupWindow {
  const factory PickupWindow({
    @TimestampConverter() required DateTime start,
    @TimestampConverter() required DateTime end,
  }) = _PickupWindow;

  factory PickupWindow.fromJson(Map<String, dynamic> json) => _$PickupWindowFromJson(json);
}

@freezed
abstract class WasteOfferModel with _$WasteOfferModel {
  const factory WasteOfferModel({
    required String id,
    required String generatorId,
    required GeoLocation generatorLocation,
    required String category,
    required double estimatedQuantityKg,
    required List<String> photos,
    @Default(false) bool canTransportSelf,
    required String status, // 'open' | 'matched' | 'scheduled' | 'completed' | 'disputed' | 'cancelled'
    @TimestampConverter() required DateTime createdAt,
    required PickupWindow preferredPickupWindow,
    String? matchedCompanyId, // written when status -> matched
  }) = _WasteOfferModel;

  factory WasteOfferModel.fromJson(Map<String, dynamic> json) => _$WasteOfferModelFromJson(json);
}
