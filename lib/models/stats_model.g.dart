// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stats_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CommunityStatsModel _$CommunityStatsModelFromJson(Map<String, dynamic> json) =>
    _CommunityStatsModel(
      id: json['id'] as String,
      totalKgRecycled: (json['totalKgRecycled'] as num?)?.toDouble() ?? 0.0,
      totalTransactions: (json['totalTransactions'] as num?)?.toInt() ?? 0,
      byCategory:
          (json['byCategory'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(k, (e as num).toDouble()),
          ) ??
          const {},
      updatedAt: const TimestampConverter().fromJson(
        json['updatedAt'] as Timestamp,
      ),
    );

Map<String, dynamic> _$CommunityStatsModelToJson(
  _CommunityStatsModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'totalKgRecycled': instance.totalKgRecycled,
  'totalTransactions': instance.totalTransactions,
  'byCategory': instance.byCategory,
  'updatedAt': const TimestampConverter().toJson(instance.updatedAt),
};
