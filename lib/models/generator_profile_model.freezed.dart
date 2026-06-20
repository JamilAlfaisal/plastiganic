// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'generator_profile_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GeneratorProfileModel {

 String get id; String get generatorType;// 'household' | 'restaurant' | 'cafe' | 'organization'
 bool get canTransportSelf;
/// Create a copy of GeneratorProfileModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GeneratorProfileModelCopyWith<GeneratorProfileModel> get copyWith => _$GeneratorProfileModelCopyWithImpl<GeneratorProfileModel>(this as GeneratorProfileModel, _$identity);

  /// Serializes this GeneratorProfileModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GeneratorProfileModel&&(identical(other.id, id) || other.id == id)&&(identical(other.generatorType, generatorType) || other.generatorType == generatorType)&&(identical(other.canTransportSelf, canTransportSelf) || other.canTransportSelf == canTransportSelf));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,generatorType,canTransportSelf);

@override
String toString() {
  return 'GeneratorProfileModel(id: $id, generatorType: $generatorType, canTransportSelf: $canTransportSelf)';
}


}

/// @nodoc
abstract mixin class $GeneratorProfileModelCopyWith<$Res>  {
  factory $GeneratorProfileModelCopyWith(GeneratorProfileModel value, $Res Function(GeneratorProfileModel) _then) = _$GeneratorProfileModelCopyWithImpl;
@useResult
$Res call({
 String id, String generatorType, bool canTransportSelf
});




}
/// @nodoc
class _$GeneratorProfileModelCopyWithImpl<$Res>
    implements $GeneratorProfileModelCopyWith<$Res> {
  _$GeneratorProfileModelCopyWithImpl(this._self, this._then);

  final GeneratorProfileModel _self;
  final $Res Function(GeneratorProfileModel) _then;

/// Create a copy of GeneratorProfileModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? generatorType = null,Object? canTransportSelf = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,generatorType: null == generatorType ? _self.generatorType : generatorType // ignore: cast_nullable_to_non_nullable
as String,canTransportSelf: null == canTransportSelf ? _self.canTransportSelf : canTransportSelf // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [GeneratorProfileModel].
extension GeneratorProfileModelPatterns on GeneratorProfileModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GeneratorProfileModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GeneratorProfileModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GeneratorProfileModel value)  $default,){
final _that = this;
switch (_that) {
case _GeneratorProfileModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GeneratorProfileModel value)?  $default,){
final _that = this;
switch (_that) {
case _GeneratorProfileModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String generatorType,  bool canTransportSelf)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GeneratorProfileModel() when $default != null:
return $default(_that.id,_that.generatorType,_that.canTransportSelf);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String generatorType,  bool canTransportSelf)  $default,) {final _that = this;
switch (_that) {
case _GeneratorProfileModel():
return $default(_that.id,_that.generatorType,_that.canTransportSelf);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String generatorType,  bool canTransportSelf)?  $default,) {final _that = this;
switch (_that) {
case _GeneratorProfileModel() when $default != null:
return $default(_that.id,_that.generatorType,_that.canTransportSelf);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GeneratorProfileModel implements GeneratorProfileModel {
  const _GeneratorProfileModel({required this.id, required this.generatorType, this.canTransportSelf = false});
  factory _GeneratorProfileModel.fromJson(Map<String, dynamic> json) => _$GeneratorProfileModelFromJson(json);

@override final  String id;
@override final  String generatorType;
// 'household' | 'restaurant' | 'cafe' | 'organization'
@override@JsonKey() final  bool canTransportSelf;

/// Create a copy of GeneratorProfileModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GeneratorProfileModelCopyWith<_GeneratorProfileModel> get copyWith => __$GeneratorProfileModelCopyWithImpl<_GeneratorProfileModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GeneratorProfileModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GeneratorProfileModel&&(identical(other.id, id) || other.id == id)&&(identical(other.generatorType, generatorType) || other.generatorType == generatorType)&&(identical(other.canTransportSelf, canTransportSelf) || other.canTransportSelf == canTransportSelf));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,generatorType,canTransportSelf);

@override
String toString() {
  return 'GeneratorProfileModel(id: $id, generatorType: $generatorType, canTransportSelf: $canTransportSelf)';
}


}

/// @nodoc
abstract mixin class _$GeneratorProfileModelCopyWith<$Res> implements $GeneratorProfileModelCopyWith<$Res> {
  factory _$GeneratorProfileModelCopyWith(_GeneratorProfileModel value, $Res Function(_GeneratorProfileModel) _then) = __$GeneratorProfileModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String generatorType, bool canTransportSelf
});




}
/// @nodoc
class __$GeneratorProfileModelCopyWithImpl<$Res>
    implements _$GeneratorProfileModelCopyWith<$Res> {
  __$GeneratorProfileModelCopyWithImpl(this._self, this._then);

  final _GeneratorProfileModel _self;
  final $Res Function(_GeneratorProfileModel) _then;

/// Create a copy of GeneratorProfileModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? generatorType = null,Object? canTransportSelf = null,}) {
  return _then(_GeneratorProfileModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,generatorType: null == generatorType ? _self.generatorType : generatorType // ignore: cast_nullable_to_non_nullable
as String,canTransportSelf: null == canTransportSelf ? _self.canTransportSelf : canTransportSelf // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
