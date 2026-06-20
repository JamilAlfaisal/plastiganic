// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TransactionModel {

 String get id; String get matchId; String get generatorId; String get companyId; String get category; double get finalWeightKg; PriceDetail get agreedPrice; double? get generatorConfirmedWeight; double? get companyConfirmedWeight; List<String>? get generatorConfirmedPhotos; List<String>? get companyConfirmedPhotos; String get status;// 'pendingConfirmation' | 'confirmed' | 'disputed' | 'resolved'
@TimestampConverter() DateTime get recordedAt;
/// Create a copy of TransactionModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TransactionModelCopyWith<TransactionModel> get copyWith => _$TransactionModelCopyWithImpl<TransactionModel>(this as TransactionModel, _$identity);

  /// Serializes this TransactionModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TransactionModel&&(identical(other.id, id) || other.id == id)&&(identical(other.matchId, matchId) || other.matchId == matchId)&&(identical(other.generatorId, generatorId) || other.generatorId == generatorId)&&(identical(other.companyId, companyId) || other.companyId == companyId)&&(identical(other.category, category) || other.category == category)&&(identical(other.finalWeightKg, finalWeightKg) || other.finalWeightKg == finalWeightKg)&&(identical(other.agreedPrice, agreedPrice) || other.agreedPrice == agreedPrice)&&(identical(other.generatorConfirmedWeight, generatorConfirmedWeight) || other.generatorConfirmedWeight == generatorConfirmedWeight)&&(identical(other.companyConfirmedWeight, companyConfirmedWeight) || other.companyConfirmedWeight == companyConfirmedWeight)&&const DeepCollectionEquality().equals(other.generatorConfirmedPhotos, generatorConfirmedPhotos)&&const DeepCollectionEquality().equals(other.companyConfirmedPhotos, companyConfirmedPhotos)&&(identical(other.status, status) || other.status == status)&&(identical(other.recordedAt, recordedAt) || other.recordedAt == recordedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,matchId,generatorId,companyId,category,finalWeightKg,agreedPrice,generatorConfirmedWeight,companyConfirmedWeight,const DeepCollectionEquality().hash(generatorConfirmedPhotos),const DeepCollectionEquality().hash(companyConfirmedPhotos),status,recordedAt);

@override
String toString() {
  return 'TransactionModel(id: $id, matchId: $matchId, generatorId: $generatorId, companyId: $companyId, category: $category, finalWeightKg: $finalWeightKg, agreedPrice: $agreedPrice, generatorConfirmedWeight: $generatorConfirmedWeight, companyConfirmedWeight: $companyConfirmedWeight, generatorConfirmedPhotos: $generatorConfirmedPhotos, companyConfirmedPhotos: $companyConfirmedPhotos, status: $status, recordedAt: $recordedAt)';
}


}

/// @nodoc
abstract mixin class $TransactionModelCopyWith<$Res>  {
  factory $TransactionModelCopyWith(TransactionModel value, $Res Function(TransactionModel) _then) = _$TransactionModelCopyWithImpl;
@useResult
$Res call({
 String id, String matchId, String generatorId, String companyId, String category, double finalWeightKg, PriceDetail agreedPrice, double? generatorConfirmedWeight, double? companyConfirmedWeight, List<String>? generatorConfirmedPhotos, List<String>? companyConfirmedPhotos, String status,@TimestampConverter() DateTime recordedAt
});


$PriceDetailCopyWith<$Res> get agreedPrice;

}
/// @nodoc
class _$TransactionModelCopyWithImpl<$Res>
    implements $TransactionModelCopyWith<$Res> {
  _$TransactionModelCopyWithImpl(this._self, this._then);

  final TransactionModel _self;
  final $Res Function(TransactionModel) _then;

/// Create a copy of TransactionModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? matchId = null,Object? generatorId = null,Object? companyId = null,Object? category = null,Object? finalWeightKg = null,Object? agreedPrice = null,Object? generatorConfirmedWeight = freezed,Object? companyConfirmedWeight = freezed,Object? generatorConfirmedPhotos = freezed,Object? companyConfirmedPhotos = freezed,Object? status = null,Object? recordedAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,matchId: null == matchId ? _self.matchId : matchId // ignore: cast_nullable_to_non_nullable
as String,generatorId: null == generatorId ? _self.generatorId : generatorId // ignore: cast_nullable_to_non_nullable
as String,companyId: null == companyId ? _self.companyId : companyId // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,finalWeightKg: null == finalWeightKg ? _self.finalWeightKg : finalWeightKg // ignore: cast_nullable_to_non_nullable
as double,agreedPrice: null == agreedPrice ? _self.agreedPrice : agreedPrice // ignore: cast_nullable_to_non_nullable
as PriceDetail,generatorConfirmedWeight: freezed == generatorConfirmedWeight ? _self.generatorConfirmedWeight : generatorConfirmedWeight // ignore: cast_nullable_to_non_nullable
as double?,companyConfirmedWeight: freezed == companyConfirmedWeight ? _self.companyConfirmedWeight : companyConfirmedWeight // ignore: cast_nullable_to_non_nullable
as double?,generatorConfirmedPhotos: freezed == generatorConfirmedPhotos ? _self.generatorConfirmedPhotos : generatorConfirmedPhotos // ignore: cast_nullable_to_non_nullable
as List<String>?,companyConfirmedPhotos: freezed == companyConfirmedPhotos ? _self.companyConfirmedPhotos : companyConfirmedPhotos // ignore: cast_nullable_to_non_nullable
as List<String>?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,recordedAt: null == recordedAt ? _self.recordedAt : recordedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}
/// Create a copy of TransactionModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PriceDetailCopyWith<$Res> get agreedPrice {
  
  return $PriceDetailCopyWith<$Res>(_self.agreedPrice, (value) {
    return _then(_self.copyWith(agreedPrice: value));
  });
}
}


/// Adds pattern-matching-related methods to [TransactionModel].
extension TransactionModelPatterns on TransactionModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TransactionModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TransactionModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TransactionModel value)  $default,){
final _that = this;
switch (_that) {
case _TransactionModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TransactionModel value)?  $default,){
final _that = this;
switch (_that) {
case _TransactionModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String matchId,  String generatorId,  String companyId,  String category,  double finalWeightKg,  PriceDetail agreedPrice,  double? generatorConfirmedWeight,  double? companyConfirmedWeight,  List<String>? generatorConfirmedPhotos,  List<String>? companyConfirmedPhotos,  String status, @TimestampConverter()  DateTime recordedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TransactionModel() when $default != null:
return $default(_that.id,_that.matchId,_that.generatorId,_that.companyId,_that.category,_that.finalWeightKg,_that.agreedPrice,_that.generatorConfirmedWeight,_that.companyConfirmedWeight,_that.generatorConfirmedPhotos,_that.companyConfirmedPhotos,_that.status,_that.recordedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String matchId,  String generatorId,  String companyId,  String category,  double finalWeightKg,  PriceDetail agreedPrice,  double? generatorConfirmedWeight,  double? companyConfirmedWeight,  List<String>? generatorConfirmedPhotos,  List<String>? companyConfirmedPhotos,  String status, @TimestampConverter()  DateTime recordedAt)  $default,) {final _that = this;
switch (_that) {
case _TransactionModel():
return $default(_that.id,_that.matchId,_that.generatorId,_that.companyId,_that.category,_that.finalWeightKg,_that.agreedPrice,_that.generatorConfirmedWeight,_that.companyConfirmedWeight,_that.generatorConfirmedPhotos,_that.companyConfirmedPhotos,_that.status,_that.recordedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String matchId,  String generatorId,  String companyId,  String category,  double finalWeightKg,  PriceDetail agreedPrice,  double? generatorConfirmedWeight,  double? companyConfirmedWeight,  List<String>? generatorConfirmedPhotos,  List<String>? companyConfirmedPhotos,  String status, @TimestampConverter()  DateTime recordedAt)?  $default,) {final _that = this;
switch (_that) {
case _TransactionModel() when $default != null:
return $default(_that.id,_that.matchId,_that.generatorId,_that.companyId,_that.category,_that.finalWeightKg,_that.agreedPrice,_that.generatorConfirmedWeight,_that.companyConfirmedWeight,_that.generatorConfirmedPhotos,_that.companyConfirmedPhotos,_that.status,_that.recordedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TransactionModel implements TransactionModel {
  const _TransactionModel({required this.id, required this.matchId, required this.generatorId, required this.companyId, required this.category, required this.finalWeightKg, required this.agreedPrice, this.generatorConfirmedWeight, this.companyConfirmedWeight, final  List<String>? generatorConfirmedPhotos, final  List<String>? companyConfirmedPhotos, required this.status, @TimestampConverter() required this.recordedAt}): _generatorConfirmedPhotos = generatorConfirmedPhotos,_companyConfirmedPhotos = companyConfirmedPhotos;
  factory _TransactionModel.fromJson(Map<String, dynamic> json) => _$TransactionModelFromJson(json);

@override final  String id;
@override final  String matchId;
@override final  String generatorId;
@override final  String companyId;
@override final  String category;
@override final  double finalWeightKg;
@override final  PriceDetail agreedPrice;
@override final  double? generatorConfirmedWeight;
@override final  double? companyConfirmedWeight;
 final  List<String>? _generatorConfirmedPhotos;
@override List<String>? get generatorConfirmedPhotos {
  final value = _generatorConfirmedPhotos;
  if (value == null) return null;
  if (_generatorConfirmedPhotos is EqualUnmodifiableListView) return _generatorConfirmedPhotos;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<String>? _companyConfirmedPhotos;
@override List<String>? get companyConfirmedPhotos {
  final value = _companyConfirmedPhotos;
  if (value == null) return null;
  if (_companyConfirmedPhotos is EqualUnmodifiableListView) return _companyConfirmedPhotos;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  String status;
// 'pendingConfirmation' | 'confirmed' | 'disputed' | 'resolved'
@override@TimestampConverter() final  DateTime recordedAt;

/// Create a copy of TransactionModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TransactionModelCopyWith<_TransactionModel> get copyWith => __$TransactionModelCopyWithImpl<_TransactionModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TransactionModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TransactionModel&&(identical(other.id, id) || other.id == id)&&(identical(other.matchId, matchId) || other.matchId == matchId)&&(identical(other.generatorId, generatorId) || other.generatorId == generatorId)&&(identical(other.companyId, companyId) || other.companyId == companyId)&&(identical(other.category, category) || other.category == category)&&(identical(other.finalWeightKg, finalWeightKg) || other.finalWeightKg == finalWeightKg)&&(identical(other.agreedPrice, agreedPrice) || other.agreedPrice == agreedPrice)&&(identical(other.generatorConfirmedWeight, generatorConfirmedWeight) || other.generatorConfirmedWeight == generatorConfirmedWeight)&&(identical(other.companyConfirmedWeight, companyConfirmedWeight) || other.companyConfirmedWeight == companyConfirmedWeight)&&const DeepCollectionEquality().equals(other._generatorConfirmedPhotos, _generatorConfirmedPhotos)&&const DeepCollectionEquality().equals(other._companyConfirmedPhotos, _companyConfirmedPhotos)&&(identical(other.status, status) || other.status == status)&&(identical(other.recordedAt, recordedAt) || other.recordedAt == recordedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,matchId,generatorId,companyId,category,finalWeightKg,agreedPrice,generatorConfirmedWeight,companyConfirmedWeight,const DeepCollectionEquality().hash(_generatorConfirmedPhotos),const DeepCollectionEquality().hash(_companyConfirmedPhotos),status,recordedAt);

@override
String toString() {
  return 'TransactionModel(id: $id, matchId: $matchId, generatorId: $generatorId, companyId: $companyId, category: $category, finalWeightKg: $finalWeightKg, agreedPrice: $agreedPrice, generatorConfirmedWeight: $generatorConfirmedWeight, companyConfirmedWeight: $companyConfirmedWeight, generatorConfirmedPhotos: $generatorConfirmedPhotos, companyConfirmedPhotos: $companyConfirmedPhotos, status: $status, recordedAt: $recordedAt)';
}


}

/// @nodoc
abstract mixin class _$TransactionModelCopyWith<$Res> implements $TransactionModelCopyWith<$Res> {
  factory _$TransactionModelCopyWith(_TransactionModel value, $Res Function(_TransactionModel) _then) = __$TransactionModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String matchId, String generatorId, String companyId, String category, double finalWeightKg, PriceDetail agreedPrice, double? generatorConfirmedWeight, double? companyConfirmedWeight, List<String>? generatorConfirmedPhotos, List<String>? companyConfirmedPhotos, String status,@TimestampConverter() DateTime recordedAt
});


@override $PriceDetailCopyWith<$Res> get agreedPrice;

}
/// @nodoc
class __$TransactionModelCopyWithImpl<$Res>
    implements _$TransactionModelCopyWith<$Res> {
  __$TransactionModelCopyWithImpl(this._self, this._then);

  final _TransactionModel _self;
  final $Res Function(_TransactionModel) _then;

/// Create a copy of TransactionModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? matchId = null,Object? generatorId = null,Object? companyId = null,Object? category = null,Object? finalWeightKg = null,Object? agreedPrice = null,Object? generatorConfirmedWeight = freezed,Object? companyConfirmedWeight = freezed,Object? generatorConfirmedPhotos = freezed,Object? companyConfirmedPhotos = freezed,Object? status = null,Object? recordedAt = null,}) {
  return _then(_TransactionModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,matchId: null == matchId ? _self.matchId : matchId // ignore: cast_nullable_to_non_nullable
as String,generatorId: null == generatorId ? _self.generatorId : generatorId // ignore: cast_nullable_to_non_nullable
as String,companyId: null == companyId ? _self.companyId : companyId // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,finalWeightKg: null == finalWeightKg ? _self.finalWeightKg : finalWeightKg // ignore: cast_nullable_to_non_nullable
as double,agreedPrice: null == agreedPrice ? _self.agreedPrice : agreedPrice // ignore: cast_nullable_to_non_nullable
as PriceDetail,generatorConfirmedWeight: freezed == generatorConfirmedWeight ? _self.generatorConfirmedWeight : generatorConfirmedWeight // ignore: cast_nullable_to_non_nullable
as double?,companyConfirmedWeight: freezed == companyConfirmedWeight ? _self.companyConfirmedWeight : companyConfirmedWeight // ignore: cast_nullable_to_non_nullable
as double?,generatorConfirmedPhotos: freezed == generatorConfirmedPhotos ? _self._generatorConfirmedPhotos : generatorConfirmedPhotos // ignore: cast_nullable_to_non_nullable
as List<String>?,companyConfirmedPhotos: freezed == companyConfirmedPhotos ? _self._companyConfirmedPhotos : companyConfirmedPhotos // ignore: cast_nullable_to_non_nullable
as List<String>?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,recordedAt: null == recordedAt ? _self.recordedAt : recordedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

/// Create a copy of TransactionModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PriceDetailCopyWith<$Res> get agreedPrice {
  
  return $PriceDetailCopyWith<$Res>(_self.agreedPrice, (value) {
    return _then(_self.copyWith(agreedPrice: value));
  });
}
}

// dart format on
