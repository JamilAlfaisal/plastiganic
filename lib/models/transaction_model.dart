import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'firestore_converters.dart';
import 'company_profile_model.dart'; // For PriceDetail

part 'transaction_model.freezed.dart';
part 'transaction_model.g.dart';

@freezed
abstract class TransactionModel with _$TransactionModel {
  const factory TransactionModel({
    required String id,
    required String matchId,
    required String generatorId,
    required String companyId,
    required String category,
    required double finalWeightKg,
    required PriceDetail agreedPrice,
    double? generatorConfirmedWeight,
    double? companyConfirmedWeight,
    List<String>? generatorConfirmedPhotos,
    List<String>? companyConfirmedPhotos,
    required String status, // 'pendingConfirmation' | 'confirmed' | 'disputed' | 'resolved'
    @TimestampConverter() required DateTime recordedAt,
  }) = _TransactionModel;

  factory TransactionModel.fromJson(Map<String, dynamic> json) => _$TransactionModelFromJson(json);
}
