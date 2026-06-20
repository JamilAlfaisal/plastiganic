// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'fraud_flag_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FraudFlagModel {

 String get id; String get targetType;// 'offer' | 'company'
 String get targetId; String get reason; double get signalScore; String? get reviewedBy; String get status;
/// Create a copy of FraudFlagModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FraudFlagModelCopyWith<FraudFlagModel> get copyWith => _$FraudFlagModelCopyWithImpl<FraudFlagModel>(this as FraudFlagModel, _$identity);

  /// Serializes this FraudFlagModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FraudFlagModel&&(identical(other.id, id) || other.id == id)&&(identical(other.targetType, targetType) || other.targetType == targetType)&&(identical(other.targetId, targetId) || other.targetId == targetId)&&(identical(other.reason, reason) || other.reason == reason)&&(identical(other.signalScore, signalScore) || other.signalScore == signalScore)&&(identical(other.reviewedBy, reviewedBy) || other.reviewedBy == reviewedBy)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,targetType,targetId,reason,signalScore,reviewedBy,status);

@override
String toString() {
  return 'FraudFlagModel(id: $id, targetType: $targetType, targetId: $targetId, reason: $reason, signalScore: $signalScore, reviewedBy: $reviewedBy, status: $status)';
}


}

/// @nodoc
abstract mixin class $FraudFlagModelCopyWith<$Res>  {
  factory $FraudFlagModelCopyWith(FraudFlagModel value, $Res Function(FraudFlagModel) _then) = _$FraudFlagModelCopyWithImpl;
@useResult
$Res call({
 String id, String targetType, String targetId, String reason, double signalScore, String? reviewedBy, String status
});




}
/// @nodoc
class _$FraudFlagModelCopyWithImpl<$Res>
    implements $FraudFlagModelCopyWith<$Res> {
  _$FraudFlagModelCopyWithImpl(this._self, this._then);

  final FraudFlagModel _self;
  final $Res Function(FraudFlagModel) _then;

/// Create a copy of FraudFlagModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? targetType = null,Object? targetId = null,Object? reason = null,Object? signalScore = null,Object? reviewedBy = freezed,Object? status = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,targetType: null == targetType ? _self.targetType : targetType // ignore: cast_nullable_to_non_nullable
as String,targetId: null == targetId ? _self.targetId : targetId // ignore: cast_nullable_to_non_nullable
as String,reason: null == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String,signalScore: null == signalScore ? _self.signalScore : signalScore // ignore: cast_nullable_to_non_nullable
as double,reviewedBy: freezed == reviewedBy ? _self.reviewedBy : reviewedBy // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [FraudFlagModel].
extension FraudFlagModelPatterns on FraudFlagModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FraudFlagModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FraudFlagModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FraudFlagModel value)  $default,){
final _that = this;
switch (_that) {
case _FraudFlagModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FraudFlagModel value)?  $default,){
final _that = this;
switch (_that) {
case _FraudFlagModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String targetType,  String targetId,  String reason,  double signalScore,  String? reviewedBy,  String status)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FraudFlagModel() when $default != null:
return $default(_that.id,_that.targetType,_that.targetId,_that.reason,_that.signalScore,_that.reviewedBy,_that.status);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String targetType,  String targetId,  String reason,  double signalScore,  String? reviewedBy,  String status)  $default,) {final _that = this;
switch (_that) {
case _FraudFlagModel():
return $default(_that.id,_that.targetType,_that.targetId,_that.reason,_that.signalScore,_that.reviewedBy,_that.status);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String targetType,  String targetId,  String reason,  double signalScore,  String? reviewedBy,  String status)?  $default,) {final _that = this;
switch (_that) {
case _FraudFlagModel() when $default != null:
return $default(_that.id,_that.targetType,_that.targetId,_that.reason,_that.signalScore,_that.reviewedBy,_that.status);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FraudFlagModel implements FraudFlagModel {
  const _FraudFlagModel({required this.id, required this.targetType, required this.targetId, required this.reason, required this.signalScore, this.reviewedBy, this.status = 'open'});
  factory _FraudFlagModel.fromJson(Map<String, dynamic> json) => _$FraudFlagModelFromJson(json);

@override final  String id;
@override final  String targetType;
// 'offer' | 'company'
@override final  String targetId;
@override final  String reason;
@override final  double signalScore;
@override final  String? reviewedBy;
@override@JsonKey() final  String status;

/// Create a copy of FraudFlagModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FraudFlagModelCopyWith<_FraudFlagModel> get copyWith => __$FraudFlagModelCopyWithImpl<_FraudFlagModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FraudFlagModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FraudFlagModel&&(identical(other.id, id) || other.id == id)&&(identical(other.targetType, targetType) || other.targetType == targetType)&&(identical(other.targetId, targetId) || other.targetId == targetId)&&(identical(other.reason, reason) || other.reason == reason)&&(identical(other.signalScore, signalScore) || other.signalScore == signalScore)&&(identical(other.reviewedBy, reviewedBy) || other.reviewedBy == reviewedBy)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,targetType,targetId,reason,signalScore,reviewedBy,status);

@override
String toString() {
  return 'FraudFlagModel(id: $id, targetType: $targetType, targetId: $targetId, reason: $reason, signalScore: $signalScore, reviewedBy: $reviewedBy, status: $status)';
}


}

/// @nodoc
abstract mixin class _$FraudFlagModelCopyWith<$Res> implements $FraudFlagModelCopyWith<$Res> {
  factory _$FraudFlagModelCopyWith(_FraudFlagModel value, $Res Function(_FraudFlagModel) _then) = __$FraudFlagModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String targetType, String targetId, String reason, double signalScore, String? reviewedBy, String status
});




}
/// @nodoc
class __$FraudFlagModelCopyWithImpl<$Res>
    implements _$FraudFlagModelCopyWith<$Res> {
  __$FraudFlagModelCopyWithImpl(this._self, this._then);

  final _FraudFlagModel _self;
  final $Res Function(_FraudFlagModel) _then;

/// Create a copy of FraudFlagModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? targetType = null,Object? targetId = null,Object? reason = null,Object? signalScore = null,Object? reviewedBy = freezed,Object? status = null,}) {
  return _then(_FraudFlagModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,targetType: null == targetType ? _self.targetType : targetType // ignore: cast_nullable_to_non_nullable
as String,targetId: null == targetId ? _self.targetId : targetId // ignore: cast_nullable_to_non_nullable
as String,reason: null == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String,signalScore: null == signalScore ? _self.signalScore : signalScore // ignore: cast_nullable_to_non_nullable
as double,reviewedBy: freezed == reviewedBy ? _self.reviewedBy : reviewedBy // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
