// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pickup_batch_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BatchStop {

 String get offerId; int get sequenceOrder;@NullableTimestampConverter() DateTime? get estimatedArrival;
/// Create a copy of BatchStop
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BatchStopCopyWith<BatchStop> get copyWith => _$BatchStopCopyWithImpl<BatchStop>(this as BatchStop, _$identity);

  /// Serializes this BatchStop to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BatchStop&&(identical(other.offerId, offerId) || other.offerId == offerId)&&(identical(other.sequenceOrder, sequenceOrder) || other.sequenceOrder == sequenceOrder)&&(identical(other.estimatedArrival, estimatedArrival) || other.estimatedArrival == estimatedArrival));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,offerId,sequenceOrder,estimatedArrival);

@override
String toString() {
  return 'BatchStop(offerId: $offerId, sequenceOrder: $sequenceOrder, estimatedArrival: $estimatedArrival)';
}


}

/// @nodoc
abstract mixin class $BatchStopCopyWith<$Res>  {
  factory $BatchStopCopyWith(BatchStop value, $Res Function(BatchStop) _then) = _$BatchStopCopyWithImpl;
@useResult
$Res call({
 String offerId, int sequenceOrder,@NullableTimestampConverter() DateTime? estimatedArrival
});




}
/// @nodoc
class _$BatchStopCopyWithImpl<$Res>
    implements $BatchStopCopyWith<$Res> {
  _$BatchStopCopyWithImpl(this._self, this._then);

  final BatchStop _self;
  final $Res Function(BatchStop) _then;

/// Create a copy of BatchStop
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? offerId = null,Object? sequenceOrder = null,Object? estimatedArrival = freezed,}) {
  return _then(_self.copyWith(
offerId: null == offerId ? _self.offerId : offerId // ignore: cast_nullable_to_non_nullable
as String,sequenceOrder: null == sequenceOrder ? _self.sequenceOrder : sequenceOrder // ignore: cast_nullable_to_non_nullable
as int,estimatedArrival: freezed == estimatedArrival ? _self.estimatedArrival : estimatedArrival // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [BatchStop].
extension BatchStopPatterns on BatchStop {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BatchStop value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BatchStop() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BatchStop value)  $default,){
final _that = this;
switch (_that) {
case _BatchStop():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BatchStop value)?  $default,){
final _that = this;
switch (_that) {
case _BatchStop() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String offerId,  int sequenceOrder, @NullableTimestampConverter()  DateTime? estimatedArrival)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BatchStop() when $default != null:
return $default(_that.offerId,_that.sequenceOrder,_that.estimatedArrival);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String offerId,  int sequenceOrder, @NullableTimestampConverter()  DateTime? estimatedArrival)  $default,) {final _that = this;
switch (_that) {
case _BatchStop():
return $default(_that.offerId,_that.sequenceOrder,_that.estimatedArrival);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String offerId,  int sequenceOrder, @NullableTimestampConverter()  DateTime? estimatedArrival)?  $default,) {final _that = this;
switch (_that) {
case _BatchStop() when $default != null:
return $default(_that.offerId,_that.sequenceOrder,_that.estimatedArrival);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BatchStop implements BatchStop {
  const _BatchStop({required this.offerId, required this.sequenceOrder, @NullableTimestampConverter() this.estimatedArrival});
  factory _BatchStop.fromJson(Map<String, dynamic> json) => _$BatchStopFromJson(json);

@override final  String offerId;
@override final  int sequenceOrder;
@override@NullableTimestampConverter() final  DateTime? estimatedArrival;

/// Create a copy of BatchStop
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BatchStopCopyWith<_BatchStop> get copyWith => __$BatchStopCopyWithImpl<_BatchStop>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BatchStopToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BatchStop&&(identical(other.offerId, offerId) || other.offerId == offerId)&&(identical(other.sequenceOrder, sequenceOrder) || other.sequenceOrder == sequenceOrder)&&(identical(other.estimatedArrival, estimatedArrival) || other.estimatedArrival == estimatedArrival));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,offerId,sequenceOrder,estimatedArrival);

@override
String toString() {
  return 'BatchStop(offerId: $offerId, sequenceOrder: $sequenceOrder, estimatedArrival: $estimatedArrival)';
}


}

/// @nodoc
abstract mixin class _$BatchStopCopyWith<$Res> implements $BatchStopCopyWith<$Res> {
  factory _$BatchStopCopyWith(_BatchStop value, $Res Function(_BatchStop) _then) = __$BatchStopCopyWithImpl;
@override @useResult
$Res call({
 String offerId, int sequenceOrder,@NullableTimestampConverter() DateTime? estimatedArrival
});




}
/// @nodoc
class __$BatchStopCopyWithImpl<$Res>
    implements _$BatchStopCopyWith<$Res> {
  __$BatchStopCopyWithImpl(this._self, this._then);

  final _BatchStop _self;
  final $Res Function(_BatchStop) _then;

/// Create a copy of BatchStop
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? offerId = null,Object? sequenceOrder = null,Object? estimatedArrival = freezed,}) {
  return _then(_BatchStop(
offerId: null == offerId ? _self.offerId : offerId // ignore: cast_nullable_to_non_nullable
as String,sequenceOrder: null == sequenceOrder ? _self.sequenceOrder : sequenceOrder // ignore: cast_nullable_to_non_nullable
as int,estimatedArrival: freezed == estimatedArrival ? _self.estimatedArrival : estimatedArrival // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}


/// @nodoc
mixin _$PickupBatchModel {

 String get id; String get companyId; String? get driverId; PickupWindow get scheduledWindow; List<BatchStop> get stops; String get status;
/// Create a copy of PickupBatchModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PickupBatchModelCopyWith<PickupBatchModel> get copyWith => _$PickupBatchModelCopyWithImpl<PickupBatchModel>(this as PickupBatchModel, _$identity);

  /// Serializes this PickupBatchModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PickupBatchModel&&(identical(other.id, id) || other.id == id)&&(identical(other.companyId, companyId) || other.companyId == companyId)&&(identical(other.driverId, driverId) || other.driverId == driverId)&&(identical(other.scheduledWindow, scheduledWindow) || other.scheduledWindow == scheduledWindow)&&const DeepCollectionEquality().equals(other.stops, stops)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,companyId,driverId,scheduledWindow,const DeepCollectionEquality().hash(stops),status);

@override
String toString() {
  return 'PickupBatchModel(id: $id, companyId: $companyId, driverId: $driverId, scheduledWindow: $scheduledWindow, stops: $stops, status: $status)';
}


}

/// @nodoc
abstract mixin class $PickupBatchModelCopyWith<$Res>  {
  factory $PickupBatchModelCopyWith(PickupBatchModel value, $Res Function(PickupBatchModel) _then) = _$PickupBatchModelCopyWithImpl;
@useResult
$Res call({
 String id, String companyId, String? driverId, PickupWindow scheduledWindow, List<BatchStop> stops, String status
});


$PickupWindowCopyWith<$Res> get scheduledWindow;

}
/// @nodoc
class _$PickupBatchModelCopyWithImpl<$Res>
    implements $PickupBatchModelCopyWith<$Res> {
  _$PickupBatchModelCopyWithImpl(this._self, this._then);

  final PickupBatchModel _self;
  final $Res Function(PickupBatchModel) _then;

/// Create a copy of PickupBatchModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? companyId = null,Object? driverId = freezed,Object? scheduledWindow = null,Object? stops = null,Object? status = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,companyId: null == companyId ? _self.companyId : companyId // ignore: cast_nullable_to_non_nullable
as String,driverId: freezed == driverId ? _self.driverId : driverId // ignore: cast_nullable_to_non_nullable
as String?,scheduledWindow: null == scheduledWindow ? _self.scheduledWindow : scheduledWindow // ignore: cast_nullable_to_non_nullable
as PickupWindow,stops: null == stops ? _self.stops : stops // ignore: cast_nullable_to_non_nullable
as List<BatchStop>,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,
  ));
}
/// Create a copy of PickupBatchModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PickupWindowCopyWith<$Res> get scheduledWindow {
  
  return $PickupWindowCopyWith<$Res>(_self.scheduledWindow, (value) {
    return _then(_self.copyWith(scheduledWindow: value));
  });
}
}


/// Adds pattern-matching-related methods to [PickupBatchModel].
extension PickupBatchModelPatterns on PickupBatchModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PickupBatchModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PickupBatchModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PickupBatchModel value)  $default,){
final _that = this;
switch (_that) {
case _PickupBatchModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PickupBatchModel value)?  $default,){
final _that = this;
switch (_that) {
case _PickupBatchModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String companyId,  String? driverId,  PickupWindow scheduledWindow,  List<BatchStop> stops,  String status)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PickupBatchModel() when $default != null:
return $default(_that.id,_that.companyId,_that.driverId,_that.scheduledWindow,_that.stops,_that.status);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String companyId,  String? driverId,  PickupWindow scheduledWindow,  List<BatchStop> stops,  String status)  $default,) {final _that = this;
switch (_that) {
case _PickupBatchModel():
return $default(_that.id,_that.companyId,_that.driverId,_that.scheduledWindow,_that.stops,_that.status);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String companyId,  String? driverId,  PickupWindow scheduledWindow,  List<BatchStop> stops,  String status)?  $default,) {final _that = this;
switch (_that) {
case _PickupBatchModel() when $default != null:
return $default(_that.id,_that.companyId,_that.driverId,_that.scheduledWindow,_that.stops,_that.status);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PickupBatchModel implements PickupBatchModel {
  const _PickupBatchModel({required this.id, required this.companyId, this.driverId, required this.scheduledWindow, required final  List<BatchStop> stops, required this.status}): _stops = stops;
  factory _PickupBatchModel.fromJson(Map<String, dynamic> json) => _$PickupBatchModelFromJson(json);

@override final  String id;
@override final  String companyId;
@override final  String? driverId;
@override final  PickupWindow scheduledWindow;
 final  List<BatchStop> _stops;
@override List<BatchStop> get stops {
  if (_stops is EqualUnmodifiableListView) return _stops;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_stops);
}

@override final  String status;

/// Create a copy of PickupBatchModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PickupBatchModelCopyWith<_PickupBatchModel> get copyWith => __$PickupBatchModelCopyWithImpl<_PickupBatchModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PickupBatchModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PickupBatchModel&&(identical(other.id, id) || other.id == id)&&(identical(other.companyId, companyId) || other.companyId == companyId)&&(identical(other.driverId, driverId) || other.driverId == driverId)&&(identical(other.scheduledWindow, scheduledWindow) || other.scheduledWindow == scheduledWindow)&&const DeepCollectionEquality().equals(other._stops, _stops)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,companyId,driverId,scheduledWindow,const DeepCollectionEquality().hash(_stops),status);

@override
String toString() {
  return 'PickupBatchModel(id: $id, companyId: $companyId, driverId: $driverId, scheduledWindow: $scheduledWindow, stops: $stops, status: $status)';
}


}

/// @nodoc
abstract mixin class _$PickupBatchModelCopyWith<$Res> implements $PickupBatchModelCopyWith<$Res> {
  factory _$PickupBatchModelCopyWith(_PickupBatchModel value, $Res Function(_PickupBatchModel) _then) = __$PickupBatchModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String companyId, String? driverId, PickupWindow scheduledWindow, List<BatchStop> stops, String status
});


@override $PickupWindowCopyWith<$Res> get scheduledWindow;

}
/// @nodoc
class __$PickupBatchModelCopyWithImpl<$Res>
    implements _$PickupBatchModelCopyWith<$Res> {
  __$PickupBatchModelCopyWithImpl(this._self, this._then);

  final _PickupBatchModel _self;
  final $Res Function(_PickupBatchModel) _then;

/// Create a copy of PickupBatchModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? companyId = null,Object? driverId = freezed,Object? scheduledWindow = null,Object? stops = null,Object? status = null,}) {
  return _then(_PickupBatchModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,companyId: null == companyId ? _self.companyId : companyId // ignore: cast_nullable_to_non_nullable
as String,driverId: freezed == driverId ? _self.driverId : driverId // ignore: cast_nullable_to_non_nullable
as String?,scheduledWindow: null == scheduledWindow ? _self.scheduledWindow : scheduledWindow // ignore: cast_nullable_to_non_nullable
as PickupWindow,stops: null == stops ? _self._stops : stops // ignore: cast_nullable_to_non_nullable
as List<BatchStop>,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of PickupBatchModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PickupWindowCopyWith<$Res> get scheduledWindow {
  
  return $PickupWindowCopyWith<$Res>(_self.scheduledWindow, (value) {
    return _then(_self.copyWith(scheduledWindow: value));
  });
}
}

// dart format on
