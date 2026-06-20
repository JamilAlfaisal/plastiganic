// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company_profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PriceDetail _$PriceDetailFromJson(Map<String, dynamic> json) => _PriceDetail(
  amount: (json['amount'] as num).toDouble(),
  currency: json['currency'] as String,
  unit: json['unit'] as String? ?? 'kg',
);

Map<String, dynamic> _$PriceDetailToJson(_PriceDetail instance) =>
    <String, dynamic>{
      'amount': instance.amount,
      'currency': instance.currency,
      'unit': instance.unit,
    };

_CompanyProfileModel _$CompanyProfileModelFromJson(Map<String, dynamic> json) =>
    _CompanyProfileModel(
      id: json['id'] as String,
      companyName: json['companyName'] as String,
      description: json['description'] as String,
      location: GeoLocation.fromJson(json['location'] as Map<String, dynamic>),
      acceptedCategories: (json['acceptedCategories'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      minWeightKg: (json['minWeightKg'] as num?)?.toDouble() ?? 0.0,
      pricePerUnit: (json['pricePerUnit'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(k, PriceDetail.fromJson(e as Map<String, dynamic>)),
      ),
      hasDrivers: json['hasDrivers'] as bool? ?? false,
      driverCapacityKgPerDay:
          (json['driverCapacityKgPerDay'] as num?)?.toDouble() ?? 0.0,
      serviceRadiusKm: (json['serviceRadiusKm'] as num?)?.toDouble() ?? 10.0,
      rating: (json['rating'] as num?)?.toDouble() ?? 5.0,
      ratingCount: (json['ratingCount'] as num?)?.toInt() ?? 0,
      isApproved: json['isApproved'] as bool? ?? false,
    );

Map<String, dynamic> _$CompanyProfileModelToJson(
  _CompanyProfileModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'companyName': instance.companyName,
  'description': instance.description,
  'location': instance.location,
  'acceptedCategories': instance.acceptedCategories,
  'minWeightKg': instance.minWeightKg,
  'pricePerUnit': instance.pricePerUnit,
  'hasDrivers': instance.hasDrivers,
  'driverCapacityKgPerDay': instance.driverCapacityKgPerDay,
  'serviceRadiusKm': instance.serviceRadiusKm,
  'rating': instance.rating,
  'ratingCount': instance.ratingCount,
  'isApproved': instance.isApproved,
};
