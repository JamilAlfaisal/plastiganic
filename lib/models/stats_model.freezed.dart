// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stats_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CommunityStatsModel {

 String get id; double get totalKgRecycled; int get totalTransactions; Map<String, double> get byCategory;@TimestampConverter() DateTime get updatedAt;
/// Create a copy of CommunityStatsModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CommunityStatsModelCopyWith<CommunityStatsModel> get copyWith => _$CommunityStatsModelCopyWithImpl<CommunityStatsModel>(this as CommunityStatsModel, _$identity);

  /// Serializes this CommunityStatsModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CommunityStatsModel&&(identical(other.id, id) || other.id == id)&&(identical(other.totalKgRecycled, totalKgRecycled) || other.totalKgRecycled == totalKgRecycled)&&(identical(other.totalTransactions, totalTransactions) || other.totalTransactions == totalTransactions)&&const DeepCollectionEquality().equals(other.byCategory, byCategory)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,totalKgRecycled,totalTransactions,const DeepCollectionEquality().hash(byCategory),updatedAt);

@override
String toString() {
  return 'CommunityStatsModel(id: $id, totalKgRecycled: $totalKgRecycled, totalTransactions: $totalTransactions, byCategory: $byCategory, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $CommunityStatsModelCopyWith<$Res>  {
  factory $CommunityStatsModelCopyWith(CommunityStatsModel value, $Res Function(CommunityStatsModel) _then) = _$CommunityStatsModelCopyWithImpl;
@useResult
$Res call({
 String id, double totalKgRecycled, int totalTransactions, Map<String, double> byCategory,@TimestampConverter() DateTime updatedAt
});




}
/// @nodoc
class _$CommunityStatsModelCopyWithImpl<$Res>
    implements $CommunityStatsModelCopyWith<$Res> {
  _$CommunityStatsModelCopyWithImpl(this._self, this._then);

  final CommunityStatsModel _self;
  final $Res Function(CommunityStatsModel) _then;

/// Create a copy of CommunityStatsModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? totalKgRecycled = null,Object? totalTransactions = null,Object? byCategory = null,Object? updatedAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,totalKgRecycled: null == totalKgRecycled ? _self.totalKgRecycled : totalKgRecycled // ignore: cast_nullable_to_non_nullable
as double,totalTransactions: null == totalTransactions ? _self.totalTransactions : totalTransactions // ignore: cast_nullable_to_non_nullable
as int,byCategory: null == byCategory ? _self.byCategory : byCategory // ignore: cast_nullable_to_non_nullable
as Map<String, double>,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [CommunityStatsModel].
extension CommunityStatsModelPatterns on CommunityStatsModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CommunityStatsModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CommunityStatsModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CommunityStatsModel value)  $default,){
final _that = this;
switch (_that) {
case _CommunityStatsModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CommunityStatsModel value)?  $default,){
final _that = this;
switch (_that) {
case _CommunityStatsModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  double totalKgRecycled,  int totalTransactions,  Map<String, double> byCategory, @TimestampConverter()  DateTime updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CommunityStatsModel() when $default != null:
return $default(_that.id,_that.totalKgRecycled,_that.totalTransactions,_that.byCategory,_that.updatedAt);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  double totalKgRecycled,  int totalTransactions,  Map<String, double> byCategory, @TimestampConverter()  DateTime updatedAt)  $default,) {final _that = this;
switch (_that) {
case _CommunityStatsModel():
return $default(_that.id,_that.totalKgRecycled,_that.totalTransactions,_that.byCategory,_that.updatedAt);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  double totalKgRecycled,  int totalTransactions,  Map<String, double> byCategory, @TimestampConverter()  DateTime updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _CommunityStatsModel() when $default != null:
return $default(_that.id,_that.totalKgRecycled,_that.totalTransactions,_that.byCategory,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CommunityStatsModel implements CommunityStatsModel {
  const _CommunityStatsModel({required this.id, this.totalKgRecycled = 0.0, this.totalTransactions = 0, final  Map<String, double> byCategory = const {}, @TimestampConverter() required this.updatedAt}): _byCategory = byCategory;
  factory _CommunityStatsModel.fromJson(Map<String, dynamic> json) => _$CommunityStatsModelFromJson(json);

@override final  String id;
@override@JsonKey() final  double totalKgRecycled;
@override@JsonKey() final  int totalTransactions;
 final  Map<String, double> _byCategory;
@override@JsonKey() Map<String, double> get byCategory {
  if (_byCategory is EqualUnmodifiableMapView) return _byCategory;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_byCategory);
}

@override@TimestampConverter() final  DateTime updatedAt;

/// Create a copy of CommunityStatsModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CommunityStatsModelCopyWith<_CommunityStatsModel> get copyWith => __$CommunityStatsModelCopyWithImpl<_CommunityStatsModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CommunityStatsModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CommunityStatsModel&&(identical(other.id, id) || other.id == id)&&(identical(other.totalKgRecycled, totalKgRecycled) || other.totalKgRecycled == totalKgRecycled)&&(identical(other.totalTransactions, totalTransactions) || other.totalTransactions == totalTransactions)&&const DeepCollectionEquality().equals(other._byCategory, _byCategory)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,totalKgRecycled,totalTransactions,const DeepCollectionEquality().hash(_byCategory),updatedAt);

@override
String toString() {
  return 'CommunityStatsModel(id: $id, totalKgRecycled: $totalKgRecycled, totalTransactions: $totalTransactions, byCategory: $byCategory, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$CommunityStatsModelCopyWith<$Res> implements $CommunityStatsModelCopyWith<$Res> {
  factory _$CommunityStatsModelCopyWith(_CommunityStatsModel value, $Res Function(_CommunityStatsModel) _then) = __$CommunityStatsModelCopyWithImpl;
@override @useResult
$Res call({
 String id, double totalKgRecycled, int totalTransactions, Map<String, double> byCategory,@TimestampConverter() DateTime updatedAt
});




}
/// @nodoc
class __$CommunityStatsModelCopyWithImpl<$Res>
    implements _$CommunityStatsModelCopyWith<$Res> {
  __$CommunityStatsModelCopyWithImpl(this._self, this._then);

  final _CommunityStatsModel _self;
  final $Res Function(_CommunityStatsModel) _then;

/// Create a copy of CommunityStatsModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? totalKgRecycled = null,Object? totalTransactions = null,Object? byCategory = null,Object? updatedAt = null,}) {
  return _then(_CommunityStatsModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,totalKgRecycled: null == totalKgRecycled ? _self.totalKgRecycled : totalKgRecycled // ignore: cast_nullable_to_non_nullable
as double,totalTransactions: null == totalTransactions ? _self.totalTransactions : totalTransactions // ignore: cast_nullable_to_non_nullable
as int,byCategory: null == byCategory ? _self._byCategory : byCategory // ignore: cast_nullable_to_non_nullable
as Map<String, double>,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
