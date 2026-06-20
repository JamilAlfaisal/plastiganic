import 'package:freezed_annotation/freezed_annotation.dart';

part 'dispute_model.freezed.dart';
part 'dispute_model.g.dart';

@freezed
abstract class DisputeModel with _$DisputeModel {
  const factory DisputeModel({
    required String id,
    required String transactionId,
    required String raisedBy, // userId
    required String reason,
    required List<String> evidence, // Cloudinary URLs
    required String status, // 'open' | 'resolved'
    String? resolutionNotes,
  }) = _DisputeModel;

  factory DisputeModel.fromJson(Map<String, dynamic> json) => _$DisputeModelFromJson(json);
}
