// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generator_profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GeneratorProfileModel _$GeneratorProfileModelFromJson(
  Map<String, dynamic> json,
) => _GeneratorProfileModel(
  id: json['id'] as String,
  generatorType: json['generatorType'] as String,
  canTransportSelf: json['canTransportSelf'] as bool? ?? false,
);

Map<String, dynamic> _$GeneratorProfileModelToJson(
  _GeneratorProfileModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'generatorType': instance.generatorType,
  'canTransportSelf': instance.canTransportSelf,
};
