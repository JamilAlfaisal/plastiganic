import 'package:freezed_annotation/freezed_annotation.dart';

part 'fraud_flag_model.freezed.dart';
part 'fraud_flag_model.g.dart';

@freezed
abstract class FraudFlagModel with _$FraudFlagModel {
  const factory FraudFlagModel({
    required String id,
    required String targetType, // 'offer' | 'company'
    required String targetId,
    required String reason,
    required double signalScore,
    String? reviewedBy,
    @Default('open') String status, // 'open' | 'reviewed'
  }) = _FraudFlagModel;

  factory FraudFlagModel.fromJson(Map<String, dynamic> json) => _$FraudFlagModelFromJson(json);
}
