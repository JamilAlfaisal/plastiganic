// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'waste_offer_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PickupWindow {

@TimestampConverter() DateTime get start;@TimestampConverter() DateTime get end;
/// Create a copy of PickupWindow
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PickupWindowCopyWith<PickupWindow> get copyWith => _$PickupWindowCopyWithImpl<PickupWindow>(this as PickupWindow, _$identity);

  /// Serializes this PickupWindow to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PickupWindow&&(identical(other.start, start) || other.start == start)&&(identical(other.end, end) || other.end == end));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,start,end);

@override
String toString() {
  return 'PickupWindow(start: $start, end: $end)';
}


}

/// @nodoc
abstract mixin class $PickupWindowCopyWith<$Res>  {
  factory $PickupWindowCopyWith(PickupWindow value, $Res Function(PickupWindow) _then) = _$PickupWindowCopyWithImpl;
@useResult
$Res call({
@TimestampConverter() DateTime start,@TimestampConverter() DateTime end
});




}
/// @nodoc
class _$PickupWindowCopyWithImpl<$Res>
    implements $PickupWindowCopyWith<$Res> {
  _$PickupWindowCopyWithImpl(this._self, this._then);

  final PickupWindow _self;
  final $Res Function(PickupWindow) _then;

/// Create a copy of PickupWindow
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? start = null,Object? end = null,}) {
  return _then(_self.copyWith(
start: null == start ? _self.start : start // ignore: cast_nullable_to_non_nullable
as DateTime,end: null == end ? _self.end : end // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [PickupWindow].
extension PickupWindowPatterns on PickupWindow {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PickupWindow value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PickupWindow() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PickupWindow value)  $default,){
final _that = this;
switch (_that) {
case _PickupWindow():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PickupWindow value)?  $default,){
final _that = this;
switch (_that) {
case _PickupWindow() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@TimestampConverter()  DateTime start, @TimestampConverter()  DateTime end)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PickupWindow() when $default != null:
return $default(_that.start,_that.end);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@TimestampConverter()  DateTime start, @TimestampConverter()  DateTime end)  $default,) {final _that = this;
switch (_that) {
case _PickupWindow():
return $default(_that.start,_that.end);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@TimestampConverter()  DateTime start, @TimestampConverter()  DateTime end)?  $default,) {final _that = this;
switch (_that) {
case _PickupWindow() when $default != null:
return $default(_that.start,_that.end);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PickupWindow implements PickupWindow {
  const _PickupWindow({@TimestampConverter() required this.start, @TimestampConverter() required this.end});
  factory _PickupWindow.fromJson(Map<String, dynamic> json) => _$PickupWindowFromJson(json);

@override@TimestampConverter() final  DateTime start;
@override@TimestampConverter() final  DateTime end;

/// Create a copy of PickupWindow
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PickupWindowCopyWith<_PickupWindow> get copyWith => __$PickupWindowCopyWithImpl<_PickupWindow>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PickupWindowToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PickupWindow&&(identical(other.start, start) || other.start == start)&&(identical(other.end, end) || other.end == end));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,start,end);

@override
String toString() {
  return 'PickupWindow(start: $start, end: $end)';
}


}

/// @nodoc
abstract mixin class _$PickupWindowCopyWith<$Res> implements $PickupWindowCopyWith<$Res> {
  factory _$PickupWindowCopyWith(_PickupWindow value, $Res Function(_PickupWindow) _then) = __$PickupWindowCopyWithImpl;
@override @useResult
$Res call({
@TimestampConverter() DateTime start,@TimestampConverter() DateTime end
});




}
/// @nodoc
class __$PickupWindowCopyWithImpl<$Res>
    implements _$PickupWindowCopyWith<$Res> {
  __$PickupWindowCopyWithImpl(this._self, this._then);

  final _PickupWindow _self;
  final $Res Function(_PickupWindow) _then;

/// Create a copy of PickupWindow
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? start = null,Object? end = null,}) {
  return _then(_PickupWindow(
start: null == start ? _self.start : start // ignore: cast_nullable_to_non_nullable
as DateTime,end: null == end ? _self.end : end // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}


/// @nodoc
mixin _$WasteOfferModel {

 String get id; String get generatorId; GeoLocation get generatorLocation; String get category; double get estimatedQuantityKg; List<String> get photos; bool get canTransportSelf; String get status;// 'open' | 'matched' | 'scheduled' | 'completed' | 'disputed' | 'cancelled'
@TimestampConverter() DateTime get createdAt; PickupWindow get preferredPickupWindow; String? get matchedCompanyId;
/// Create a copy of WasteOfferModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WasteOfferModelCopyWith<WasteOfferModel> get copyWith => _$WasteOfferModelCopyWithImpl<WasteOfferModel>(this as WasteOfferModel, _$identity);

  /// Serializes this WasteOfferModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WasteOfferModel&&(identical(other.id, id) || other.id == id)&&(identical(other.generatorId, generatorId) || other.generatorId == generatorId)&&(identical(other.generatorLocation, generatorLocation) || other.generatorLocation == generatorLocation)&&(identical(other.category, category) || other.category == category)&&(identical(other.estimatedQuantityKg, estimatedQuantityKg) || other.estimatedQuantityKg == estimatedQuantityKg)&&const DeepCollectionEquality().equals(other.photos, photos)&&(identical(other.canTransportSelf, canTransportSelf) || other.canTransportSelf == canTransportSelf)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.preferredPickupWindow, preferredPickupWindow) || other.preferredPickupWindow == preferredPickupWindow)&&(identical(other.matchedCompanyId, matchedCompanyId) || other.matchedCompanyId == matchedCompanyId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,generatorId,generatorLocation,category,estimatedQuantityKg,const DeepCollectionEquality().hash(photos),canTransportSelf,status,createdAt,preferredPickupWindow,matchedCompanyId);

@override
String toString() {
  return 'WasteOfferModel(id: $id, generatorId: $generatorId, generatorLocation: $generatorLocation, category: $category, estimatedQuantityKg: $estimatedQuantityKg, photos: $photos, canTransportSelf: $canTransportSelf, status: $status, createdAt: $createdAt, preferredPickupWindow: $preferredPickupWindow, matchedCompanyId: $matchedCompanyId)';
}


}

/// @nodoc
abstract mixin class $WasteOfferModelCopyWith<$Res>  {
  factory $WasteOfferModelCopyWith(WasteOfferModel value, $Res Function(WasteOfferModel) _then) = _$WasteOfferModelCopyWithImpl;
@useResult
$Res call({
 String id, String generatorId, GeoLocation generatorLocation, String category, double estimatedQuantityKg, List<String> photos, bool canTransportSelf, String status,@TimestampConverter() DateTime createdAt, PickupWindow preferredPickupWindow, String? matchedCompanyId
});


$GeoLocationCopyWith<$Res> get generatorLocation;$PickupWindowCopyWith<$Res> get preferredPickupWindow;

}
/// @nodoc
class _$WasteOfferModelCopyWithImpl<$Res>
    implements $WasteOfferModelCopyWith<$Res> {
  _$WasteOfferModelCopyWithImpl(this._self, this._then);

  final WasteOfferModel _self;
  final $Res Function(WasteOfferModel) _then;

/// Create a copy of WasteOfferModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? generatorId = null,Object? generatorLocation = null,Object? category = null,Object? estimatedQuantityKg = null,Object? photos = null,Object? canTransportSelf = null,Object? status = null,Object? createdAt = null,Object? preferredPickupWindow = null,Object? matchedCompanyId = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,generatorId: null == generatorId ? _self.generatorId : generatorId // ignore: cast_nullable_to_non_nullable
as String,generatorLocation: null == generatorLocation ? _self.generatorLocation : generatorLocation // ignore: cast_nullable_to_non_nullable
as GeoLocation,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,estimatedQuantityKg: null == estimatedQuantityKg ? _self.estimatedQuantityKg : estimatedQuantityKg // ignore: cast_nullable_to_non_nullable
as double,photos: null == photos ? _self.photos : photos // ignore: cast_nullable_to_non_nullable
as List<String>,canTransportSelf: null == canTransportSelf ? _self.canTransportSelf : canTransportSelf // ignore: cast_nullable_to_non_nullable
as bool,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,preferredPickupWindow: null == preferredPickupWindow ? _self.preferredPickupWindow : preferredPickupWindow // ignore: cast_nullable_to_non_nullable
as PickupWindow,matchedCompanyId: freezed == matchedCompanyId ? _self.matchedCompanyId : matchedCompanyId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of WasteOfferModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GeoLocationCopyWith<$Res> get generatorLocation {
  
  return $GeoLocationCopyWith<$Res>(_self.generatorLocation, (value) {
    return _then(_self.copyWith(generatorLocation: value));
  });
}/// Create a copy of WasteOfferModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PickupWindowCopyWith<$Res> get preferredPickupWindow {
  
  return $PickupWindowCopyWith<$Res>(_self.preferredPickupWindow, (value) {
    return _then(_self.copyWith(preferredPickupWindow: value));
  });
}
}


/// Adds pattern-matching-related methods to [WasteOfferModel].
extension WasteOfferModelPatterns on WasteOfferModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WasteOfferModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WasteOfferModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WasteOfferModel value)  $default,){
final _that = this;
switch (_that) {
case _WasteOfferModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WasteOfferModel value)?  $default,){
final _that = this;
switch (_that) {
case _WasteOfferModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String generatorId,  GeoLocation generatorLocation,  String category,  double estimatedQuantityKg,  List<String> photos,  bool canTransportSelf,  String status, @TimestampConverter()  DateTime createdAt,  PickupWindow preferredPickupWindow,  String? matchedCompanyId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WasteOfferModel() when $default != null:
return $default(_that.id,_that.generatorId,_that.generatorLocation,_that.category,_that.estimatedQuantityKg,_that.photos,_that.canTransportSelf,_that.status,_that.createdAt,_that.preferredPickupWindow,_that.matchedCompanyId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String generatorId,  GeoLocation generatorLocation,  String category,  double estimatedQuantityKg,  List<String> photos,  bool canTransportSelf,  String status, @TimestampConverter()  DateTime createdAt,  PickupWindow preferredPickupWindow,  String? matchedCompanyId)  $default,) {final _that = this;
switch (_that) {
case _WasteOfferModel():
return $default(_that.id,_that.generatorId,_that.generatorLocation,_that.category,_that.estimatedQuantityKg,_that.photos,_that.canTransportSelf,_that.status,_that.createdAt,_that.preferredPickupWindow,_that.matchedCompanyId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String generatorId,  GeoLocation generatorLocation,  String category,  double estimatedQuantityKg,  List<String> photos,  bool canTransportSelf,  String status, @TimestampConverter()  DateTime createdAt,  PickupWindow preferredPickupWindow,  String? matchedCompanyId)?  $default,) {final _that = this;
switch (_that) {
case _WasteOfferModel() when $default != null:
return $default(_that.id,_that.generatorId,_that.generatorLocation,_that.category,_that.estimatedQuantityKg,_that.photos,_that.canTransportSelf,_that.status,_that.createdAt,_that.preferredPickupWindow,_that.matchedCompanyId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WasteOfferModel implements WasteOfferModel {
  const _WasteOfferModel({required this.id, required this.generatorId, required this.generatorLocation, required this.category, required this.estimatedQuantityKg, required final  List<String> photos, this.canTransportSelf = false, required this.status, @TimestampConverter() required this.createdAt, required this.preferredPickupWindow, this.matchedCompanyId}): _photos = photos;
  factory _WasteOfferModel.fromJson(Map<String, dynamic> json) => _$WasteOfferModelFromJson(json);

@override final  String id;
@override final  String generatorId;
@override final  GeoLocation generatorLocation;
@override final  String category;
@override final  double estimatedQuantityKg;
 final  List<String> _photos;
@override List<String> get photos {
  if (_photos is EqualUnmodifiableListView) return _photos;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_photos);
}

@override@JsonKey() final  bool canTransportSelf;
@override final  String status;
// 'open' | 'matched' | 'scheduled' | 'completed' | 'disputed' | 'cancelled'
@override@TimestampConverter() final  DateTime createdAt;
@override final  PickupWindow preferredPickupWindow;
@override final  String? matchedCompanyId;

/// Create a copy of WasteOfferModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WasteOfferModelCopyWith<_WasteOfferModel> get copyWith => __$WasteOfferModelCopyWithImpl<_WasteOfferModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WasteOfferModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WasteOfferModel&&(identical(other.id, id) || other.id == id)&&(identical(other.generatorId, generatorId) || other.generatorId == generatorId)&&(identical(other.generatorLocation, generatorLocation) || other.generatorLocation == generatorLocation)&&(identical(other.category, category) || other.category == category)&&(identical(other.estimatedQuantityKg, estimatedQuantityKg) || other.estimatedQuantityKg == estimatedQuantityKg)&&const DeepCollectionEquality().equals(other._photos, _photos)&&(identical(other.canTransportSelf, canTransportSelf) || other.canTransportSelf == canTransportSelf)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.preferredPickupWindow, preferredPickupWindow) || other.preferredPickupWindow == preferredPickupWindow)&&(identical(other.matchedCompanyId, matchedCompanyId) || other.matchedCompanyId == matchedCompanyId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,generatorId,generatorLocation,category,estimatedQuantityKg,const DeepCollectionEquality().hash(_photos),canTransportSelf,status,createdAt,preferredPickupWindow,matchedCompanyId);

@override
String toString() {
  return 'WasteOfferModel(id: $id, generatorId: $generatorId, generatorLocation: $generatorLocation, category: $category, estimatedQuantityKg: $estimatedQuantityKg, photos: $photos, canTransportSelf: $canTransportSelf, status: $status, createdAt: $createdAt, preferredPickupWindow: $preferredPickupWindow, matchedCompanyId: $matchedCompanyId)';
}


}

/// @nodoc
abstract mixin class _$WasteOfferModelCopyWith<$Res> implements $WasteOfferModelCopyWith<$Res> {
  factory _$WasteOfferModelCopyWith(_WasteOfferModel value, $Res Function(_WasteOfferModel) _then) = __$WasteOfferModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String generatorId, GeoLocation generatorLocation, String category, double estimatedQuantityKg, List<String> photos, bool canTransportSelf, String status,@TimestampConverter() DateTime createdAt, PickupWindow preferredPickupWindow, String? matchedCompanyId
});


@override $GeoLocationCopyWith<$Res> get generatorLocation;@override $PickupWindowCopyWith<$Res> get preferredPickupWindow;

}
/// @nodoc
class __$WasteOfferModelCopyWithImpl<$Res>
    implements _$WasteOfferModelCopyWith<$Res> {
  __$WasteOfferModelCopyWithImpl(this._self, this._then);

  final _WasteOfferModel _self;
  final $Res Function(_WasteOfferModel) _then;

/// Create a copy of WasteOfferModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? generatorId = null,Object? generatorLocation = null,Object? category = null,Object? estimatedQuantityKg = null,Object? photos = null,Object? canTransportSelf = null,Object? status = null,Object? createdAt = null,Object? preferredPickupWindow = null,Object? matchedCompanyId = freezed,}) {
  return _then(_WasteOfferModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,generatorId: null == generatorId ? _self.generatorId : generatorId // ignore: cast_nullable_to_non_nullable
as String,generatorLocation: null == generatorLocation ? _self.generatorLocation : generatorLocation // ignore: cast_nullable_to_non_nullable
as GeoLocation,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,estimatedQuantityKg: null == estimatedQuantityKg ? _self.estimatedQuantityKg : estimatedQuantityKg // ignore: cast_nullable_to_non_nullable
as double,photos: null == photos ? _self._photos : photos // ignore: cast_nullable_to_non_nullable
as List<String>,canTransportSelf: null == canTransportSelf ? _self.canTransportSelf : canTransportSelf // ignore: cast_nullable_to_non_nullable
as bool,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,preferredPickupWindow: null == preferredPickupWindow ? _self.preferredPickupWindow : preferredPickupWindow // ignore: cast_nullable_to_non_nullable
as PickupWindow,matchedCompanyId: freezed == matchedCompanyId ? _self.matchedCompanyId : matchedCompanyId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of WasteOfferModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GeoLocationCopyWith<$Res> get generatorLocation {
  
  return $GeoLocationCopyWith<$Res>(_self.generatorLocation, (value) {
    return _then(_self.copyWith(generatorLocation: value));
  });
}/// Create a copy of WasteOfferModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PickupWindowCopyWith<$Res> get preferredPickupWindow {
  
  return $PickupWindowCopyWith<$Res>(_self.preferredPickupWindow, (value) {
    return _then(_self.copyWith(preferredPickupWindow: value));
  });
}
}

// dart format on
