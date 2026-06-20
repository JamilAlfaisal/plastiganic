// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GeoLocation _$GeoLocationFromJson(Map<String, dynamic> json) => _GeoLocation(
  geopoint: const GeoPointConverter().fromJson(json['geopoint'] as GeoPoint),
  geohash: json['geohash'] as String,
);

Map<String, dynamic> _$GeoLocationToJson(_GeoLocation instance) =>
    <String, dynamic>{
      'geopoint': const GeoPointConverter().toJson(instance.geopoint),
      'geohash': instance.geohash,
    };

_UserModel _$UserModelFromJson(Map<String, dynamic> json) => _UserModel(
  id: json['id'] as String,
  role: json['role'] as String,
  displayName: json['displayName'] as String,
  photoUrl: json['photoUrl'] as String?,
  phone: json['phone'] as String,
  email: json['email'] as String,
  location: GeoLocation.fromJson(json['location'] as Map<String, dynamic>),
  languagePref: json['languagePref'] as String? ?? 'en',
  createdAt: const TimestampConverter().fromJson(
    json['createdAt'] as Timestamp,
  ),
  lastActiveAt: const TimestampConverter().fromJson(
    json['lastActiveAt'] as Timestamp,
  ),
  trustScore: (json['trustScore'] as num?)?.toDouble() ?? 100.0,
  isVerified: json['isVerified'] as bool? ?? false,
);

Map<String, dynamic> _$UserModelToJson(_UserModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'role': instance.role,
      'displayName': instance.displayName,
      'photoUrl': instance.photoUrl,
      'phone': instance.phone,
      'email': instance.email,
      'location': instance.location,
      'languagePref': instance.languagePref,
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
      'lastActiveAt': const TimestampConverter().toJson(instance.lastActiveAt),
      'trustScore': instance.trustScore,
      'isVerified': instance.isVerified,
    };
