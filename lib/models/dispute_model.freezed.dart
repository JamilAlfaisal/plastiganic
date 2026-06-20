// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dispute_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DisputeModel {

 String get id; String get transactionId; String get raisedBy;// userId
 String get reason; List<String> get evidence;// Cloudinary URLs
 String get status;// 'open' | 'resolved'
 String? get resolutionNotes;
/// Create a copy of DisputeModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DisputeModelCopyWith<DisputeModel> get copyWith => _$DisputeModelCopyWithImpl<DisputeModel>(this as DisputeModel, _$identity);

  /// Serializes this DisputeModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DisputeModel&&(identical(other.id, id) || other.id == id)&&(identical(other.transactionId, transactionId) || other.transactionId == transactionId)&&(identical(other.raisedBy, raisedBy) || other.raisedBy == raisedBy)&&(identical(other.reason, reason) || other.reason == reason)&&const DeepCollectionEquality().equals(other.evidence, evidence)&&(identical(other.status, status) || other.status == status)&&(identical(other.resolutionNotes, resolutionNotes) || other.resolutionNotes == resolutionNotes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,transactionId,raisedBy,reason,const DeepCollectionEquality().hash(evidence),status,resolutionNotes);

@override
String toString() {
  return 'DisputeModel(id: $id, transactionId: $transactionId, raisedBy: $raisedBy, reason: $reason, evidence: $evidence, status: $status, resolutionNotes: $resolutionNotes)';
}


}

/// @nodoc
abstract mixin class $DisputeModelCopyWith<$Res>  {
  factory $DisputeModelCopyWith(DisputeModel value, $Res Function(DisputeModel) _then) = _$DisputeModelCopyWithImpl;
@useResult
$Res call({
 String id, String transactionId, String raisedBy, String reason, List<String> evidence, String status, String? resolutionNotes
});




}
/// @nodoc
class _$DisputeModelCopyWithImpl<$Res>
    implements $DisputeModelCopyWith<$Res> {
  _$DisputeModelCopyWithImpl(this._self, this._then);

  final DisputeModel _self;
  final $Res Function(DisputeModel) _then;

/// Create a copy of DisputeModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? transactionId = null,Object? raisedBy = null,Object? reason = null,Object? evidence = null,Object? status = null,Object? resolutionNotes = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,transactionId: null == transactionId ? _self.transactionId : transactionId // ignore: cast_nullable_to_non_nullable
as String,raisedBy: null == raisedBy ? _self.raisedBy : raisedBy // ignore: cast_nullable_to_non_nullable
as String,reason: null == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String,evidence: null == evidence ? _self.evidence : evidence // ignore: cast_nullable_to_non_nullable
as List<String>,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,resolutionNotes: freezed == resolutionNotes ? _self.resolutionNotes : resolutionNotes // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [DisputeModel].
extension DisputeModelPatterns on DisputeModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DisputeModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DisputeModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DisputeModel value)  $default,){
final _that = this;
switch (_that) {
case _DisputeModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DisputeModel value)?  $default,){
final _that = this;
switch (_that) {
case _DisputeModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String transactionId,  String raisedBy,  String reason,  List<String> evidence,  String status,  String? resolutionNotes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DisputeModel() when $default != null:
return $default(_that.id,_that.transactionId,_that.raisedBy,_that.reason,_that.evidence,_that.status,_that.resolutionNotes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String transactionId,  String raisedBy,  String reason,  List<String> evidence,  String status,  String? resolutionNotes)  $default,) {final _that = this;
switch (_that) {
case _DisputeModel():
return $default(_that.id,_that.transactionId,_that.raisedBy,_that.reason,_that.evidence,_that.status,_that.resolutionNotes);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String transactionId,  String raisedBy,  String reason,  List<String> evidence,  String status,  String? resolutionNotes)?  $default,) {final _that = this;
switch (_that) {
case _DisputeModel() when $default != null:
return $default(_that.id,_that.transactionId,_that.raisedBy,_that.reason,_that.evidence,_that.status,_that.resolutionNotes);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DisputeModel implements DisputeModel {
  const _DisputeModel({required this.id, required this.transactionId, required this.raisedBy, required this.reason, required final  List<String> evidence, required this.status, this.resolutionNotes}): _evidence = evidence;
  factory _DisputeModel.fromJson(Map<String, dynamic> json) => _$DisputeModelFromJson(json);

@override final  String id;
@override final  String transactionId;
@override final  String raisedBy;
// userId
@override final  String reason;
 final  List<String> _evidence;
@override List<String> get evidence {
  if (_evidence is EqualUnmodifiableListView) return _evidence;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_evidence);
}

// Cloudinary URLs
@override final  String status;
// 'open' | 'resolved'
@override final  String? resolutionNotes;

/// Create a copy of DisputeModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DisputeModelCopyWith<_DisputeModel> get copyWith => __$DisputeModelCopyWithImpl<_DisputeModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DisputeModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DisputeModel&&(identical(other.id, id) || other.id == id)&&(identical(other.transactionId, transactionId) || other.transactionId == transactionId)&&(identical(other.raisedBy, raisedBy) || other.raisedBy == raisedBy)&&(identical(other.reason, reason) || other.reason == reason)&&const DeepCollectionEquality().equals(other._evidence, _evidence)&&(identical(other.status, status) || other.status == status)&&(identical(other.resolutionNotes, resolutionNotes) || other.resolutionNotes == resolutionNotes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,transactionId,raisedBy,reason,const DeepCollectionEquality().hash(_evidence),status,resolutionNotes);

@override
String toString() {
  return 'DisputeModel(id: $id, transactionId: $transactionId, raisedBy: $raisedBy, reason: $reason, evidence: $evidence, status: $status, resolutionNotes: $resolutionNotes)';
}


}

/// @nodoc
abstract mixin class _$DisputeModelCopyWith<$Res> implements $DisputeModelCopyWith<$Res> {
  factory _$DisputeModelCopyWith(_DisputeModel value, $Res Function(_DisputeModel) _then) = __$DisputeModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String transactionId, String raisedBy, String reason, List<String> evidence, String status, String? resolutionNotes
});




}
/// @nodoc
class __$DisputeModelCopyWithImpl<$Res>
    implements _$DisputeModelCopyWith<$Res> {
  __$DisputeModelCopyWithImpl(this._self, this._then);

  final _DisputeModel _self;
  final $Res Function(_DisputeModel) _then;

/// Create a copy of DisputeModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? transactionId = null,Object? raisedBy = null,Object? reason = null,Object? evidence = null,Object? status = null,Object? resolutionNotes = freezed,}) {
  return _then(_DisputeModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,transactionId: null == transactionId ? _self.transactionId : transactionId // ignore: cast_nullable_to_non_nullable
as String,raisedBy: null == raisedBy ? _self.raisedBy : raisedBy // ignore: cast_nullable_to_non_nullable
as String,reason: null == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String,evidence: null == evidence ? _self._evidence : evidence // ignore: cast_nullable_to_non_nullable
as List<String>,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,resolutionNotes: freezed == resolutionNotes ? _self.resolutionNotes : resolutionNotes // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
