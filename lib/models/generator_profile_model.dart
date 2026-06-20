import 'package:freezed_annotation/freezed_annotation.dart';

part 'generator_profile_model.freezed.dart';
part 'generator_profile_model.g.dart';

@freezed
abstract class GeneratorProfileModel with _$GeneratorProfileModel {
  const factory GeneratorProfileModel({
    required String id,
    required String generatorType, // 'household' | 'restaurant' | 'cafe' | 'organization'
    @Default(false) bool canTransportSelf,
  }) = _GeneratorProfileModel;

  factory GeneratorProfileModel.fromJson(Map<String, dynamic> json) => _$GeneratorProfileModelFromJson(json);
}
