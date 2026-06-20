import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'firestore_converters.dart';

part 'stats_model.freezed.dart';
part 'stats_model.g.dart';

@freezed
abstract class CommunityStatsModel with _$CommunityStatsModel {
  const factory CommunityStatsModel({
    required String id,
    @Default(0.0) double totalKgRecycled,
    @Default(0) int totalTransactions,
    @Default({}) Map<String, double> byCategory,
    @TimestampConverter() required DateTime updatedAt,
  }) = _CommunityStatsModel;

  factory CommunityStatsModel.fromJson(Map<String, dynamic> json) => _$CommunityStatsModelFromJson(json);
}
