import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'firestore_converters.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
abstract class GeoLocation with _$GeoLocation {
  const factory GeoLocation({
    @GeoPointConverter() required GeoPoint geopoint,
    required String geohash,
  }) = _GeoLocation;

  factory GeoLocation.fromJson(Map<String, dynamic> json) => _$GeoLocationFromJson(json);
}

@freezed
abstract class UserModel with _$UserModel {
  const factory UserModel({
    required String id,
    required String role, // 'generator' | 'company'
    required String displayName,
    String? photoUrl,
    required String phone,
    required String email,
    required GeoLocation location,
    @Default('en') String languagePref,
    @TimestampConverter() required DateTime createdAt,
    @TimestampConverter() required DateTime lastActiveAt,
    @Default(100.0) double trustScore,
    @Default(false) bool isVerified,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);
}
