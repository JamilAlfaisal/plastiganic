import 'package:freezed_annotation/freezed_annotation.dart';
import 'user_model.dart'; // For GeoLocation reference

part 'company_profile_model.freezed.dart';
part 'company_profile_model.g.dart';

@freezed
abstract class PriceDetail with _$PriceDetail {
  const factory PriceDetail({
    required double amount,
    required String currency, // 'LBP' | 'USD'
    @Default('kg') String unit, // 'kg' | 'item'
  }) = _PriceDetail;

  factory PriceDetail.fromJson(Map<String, dynamic> json) => _$PriceDetailFromJson(json);
}

@freezed
abstract class CompanyProfileModel with _$CompanyProfileModel {
  const factory CompanyProfileModel({
    required String id,
    required String companyName,
    required String description,
    required GeoLocation location,
    required List<String> acceptedCategories,
    @Default(0.0) double minWeightKg,
    required Map<String, PriceDetail> pricePerUnit, // category -> details
    @Default(false) bool hasDrivers,
    @Default(0.0) double driverCapacityKgPerDay,
    @Default(10.0) double serviceRadiusKm,
    @Default(5.0) double rating,
    @Default(0) int ratingCount,
    @Default(false) bool isApproved,
  }) = _CompanyProfileModel;

  factory CompanyProfileModel.fromJson(Map<String, dynamic> json) => _$CompanyProfileModelFromJson(json);
}
