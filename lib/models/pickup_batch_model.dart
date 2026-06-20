import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'firestore_converters.dart';
import 'waste_offer_model.dart'; // For PickupWindow

part 'pickup_batch_model.freezed.dart';
part 'pickup_batch_model.g.dart';

@freezed
abstract class BatchStop with _$BatchStop {
  const factory BatchStop({
    required String offerId,
    required int sequenceOrder,
    @NullableTimestampConverter() DateTime? estimatedArrival,
  }) = _BatchStop;

  factory BatchStop.fromJson(Map<String, dynamic> json) => _$BatchStopFromJson(json);
}

@freezed
abstract class PickupBatchModel with _$PickupBatchModel {
  const factory PickupBatchModel({
    required String id,
    required String companyId,
    String? driverId,
    required PickupWindow scheduledWindow,
    required List<BatchStop> stops,
    required String status, // 'pending' | 'in_progress' | 'completed'
  }) = _PickupBatchModel;

  factory PickupBatchModel.fromJson(Map<String, dynamic> json) => _$PickupBatchModelFromJson(json);
}

