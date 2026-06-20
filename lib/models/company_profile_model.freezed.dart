// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'company_profile_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PriceDetail {

 double get amount; String get currency;// 'LBP' | 'USD'
 String get unit;
/// Create a copy of PriceDetail
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PriceDetailCopyWith<PriceDetail> get copyWith => _$PriceDetailCopyWithImpl<PriceDetail>(this as PriceDetail, _$identity);

  /// Serializes this PriceDetail to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PriceDetail&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.unit, unit) || other.unit == unit));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,amount,currency,unit);

@override
String toString() {
  return 'PriceDetail(amount: $amount, currency: $currency, unit: $unit)';
}


}

/// @nodoc
abstract mixin class $PriceDetailCopyWith<$Res>  {
  factory $PriceDetailCopyWith(PriceDetail value, $Res Function(PriceDetail) _then) = _$PriceDetailCopyWithImpl;
@useResult
$Res call({
 double amount, String currency, String unit
});




}
/// @nodoc
class _$PriceDetailCopyWithImpl<$Res>
    implements $PriceDetailCopyWith<$Res> {
  _$PriceDetailCopyWithImpl(this._self, this._then);

  final PriceDetail _self;
  final $Res Function(PriceDetail) _then;

/// Create a copy of PriceDetail
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? amount = null,Object? currency = null,Object? unit = null,}) {
  return _then(_self.copyWith(
amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,unit: null == unit ? _self.unit : unit // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [PriceDetail].
extension PriceDetailPatterns on PriceDetail {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PriceDetail value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PriceDetail() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PriceDetail value)  $default,){
final _that = this;
switch (_that) {
case _PriceDetail():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PriceDetail value)?  $default,){
final _that = this;
switch (_that) {
case _PriceDetail() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double amount,  String currency,  String unit)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PriceDetail() when $default != null:
return $default(_that.amount,_that.currency,_that.unit);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double amount,  String currency,  String unit)  $default,) {final _that = this;
switch (_that) {
case _PriceDetail():
return $default(_that.amount,_that.currency,_that.unit);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double amount,  String currency,  String unit)?  $default,) {final _that = this;
switch (_that) {
case _PriceDetail() when $default != null:
return $default(_that.amount,_that.currency,_that.unit);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PriceDetail implements PriceDetail {
  const _PriceDetail({required this.amount, required this.currency, this.unit = 'kg'});
  factory _PriceDetail.fromJson(Map<String, dynamic> json) => _$PriceDetailFromJson(json);

@override final  double amount;
@override final  String currency;
// 'LBP' | 'USD'
@override@JsonKey() final  String unit;

/// Create a copy of PriceDetail
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PriceDetailCopyWith<_PriceDetail> get copyWith => __$PriceDetailCopyWithImpl<_PriceDetail>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PriceDetailToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PriceDetail&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.unit, unit) || other.unit == unit));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,amount,currency,unit);

@override
String toString() {
  return 'PriceDetail(amount: $amount, currency: $currency, unit: $unit)';
}


}

/// @nodoc
abstract mixin class _$PriceDetailCopyWith<$Res> implements $PriceDetailCopyWith<$Res> {
  factory _$PriceDetailCopyWith(_PriceDetail value, $Res Function(_PriceDetail) _then) = __$PriceDetailCopyWithImpl;
@override @useResult
$Res call({
 double amount, String currency, String unit
});




}
/// @nodoc
class __$PriceDetailCopyWithImpl<$Res>
    implements _$PriceDetailCopyWith<$Res> {
  __$PriceDetailCopyWithImpl(this._self, this._then);

  final _PriceDetail _self;
  final $Res Function(_PriceDetail) _then;

/// Create a copy of PriceDetail
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? amount = null,Object? currency = null,Object? unit = null,}) {
  return _then(_PriceDetail(
amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,unit: null == unit ? _self.unit : unit // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$CompanyProfileModel {

 String get id; String get companyName; String get description; GeoLocation get location; List<String> get acceptedCategories; double get minWeightKg; Map<String, PriceDetail> get pricePerUnit;// category -> details
 bool get hasDrivers; double get driverCapacityKgPerDay; double get serviceRadiusKm; double get rating; int get ratingCount; bool get isApproved;
/// Create a copy of CompanyProfileModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CompanyProfileModelCopyWith<CompanyProfileModel> get copyWith => _$CompanyProfileModelCopyWithImpl<CompanyProfileModel>(this as CompanyProfileModel, _$identity);

  /// Serializes this CompanyProfileModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CompanyProfileModel&&(identical(other.id, id) || other.id == id)&&(identical(other.companyName, companyName) || other.companyName == companyName)&&(identical(other.description, description) || other.description == description)&&(identical(other.location, location) || other.location == location)&&const DeepCollectionEquality().equals(other.acceptedCategories, acceptedCategories)&&(identical(other.minWeightKg, minWeightKg) || other.minWeightKg == minWeightKg)&&const DeepCollectionEquality().equals(other.pricePerUnit, pricePerUnit)&&(identical(other.hasDrivers, hasDrivers) || other.hasDrivers == hasDrivers)&&(identical(other.driverCapacityKgPerDay, driverCapacityKgPerDay) || other.driverCapacityKgPerDay == driverCapacityKgPerDay)&&(identical(other.serviceRadiusKm, serviceRadiusKm) || other.serviceRadiusKm == serviceRadiusKm)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.ratingCount, ratingCount) || other.ratingCount == ratingCount)&&(identical(other.isApproved, isApproved) || other.isApproved == isApproved));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,companyName,description,location,const DeepCollectionEquality().hash(acceptedCategories),minWeightKg,const DeepCollectionEquality().hash(pricePerUnit),hasDrivers,driverCapacityKgPerDay,serviceRadiusKm,rating,ratingCount,isApproved);

@override
String toString() {
  return 'CompanyProfileModel(id: $id, companyName: $companyName, description: $description, location: $location, acceptedCategories: $acceptedCategories, minWeightKg: $minWeightKg, pricePerUnit: $pricePerUnit, hasDrivers: $hasDrivers, driverCapacityKgPerDay: $driverCapacityKgPerDay, serviceRadiusKm: $serviceRadiusKm, rating: $rating, ratingCount: $ratingCount, isApproved: $isApproved)';
}


}

/// @nodoc
abstract mixin class $CompanyProfileModelCopyWith<$Res>  {
  factory $CompanyProfileModelCopyWith(CompanyProfileModel value, $Res Function(CompanyProfileModel) _then) = _$CompanyProfileModelCopyWithImpl;
@useResult
$Res call({
 String id, String companyName, String description, GeoLocation location, List<String> acceptedCategories, double minWeightKg, Map<String, PriceDetail> pricePerUnit, bool hasDrivers, double driverCapacityKgPerDay, double serviceRadiusKm, double rating, int ratingCount, bool isApproved
});


$GeoLocationCopyWith<$Res> get location;

}
/// @nodoc
class _$CompanyProfileModelCopyWithImpl<$Res>
    implements $CompanyProfileModelCopyWith<$Res> {
  _$CompanyProfileModelCopyWithImpl(this._self, this._then);

  final CompanyProfileModel _self;
  final $Res Function(CompanyProfileModel) _then;

/// Create a copy of CompanyProfileModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? companyName = null,Object? description = null,Object? location = null,Object? acceptedCategories = null,Object? minWeightKg = null,Object? pricePerUnit = null,Object? hasDrivers = null,Object? driverCapacityKgPerDay = null,Object? serviceRadiusKm = null,Object? rating = null,Object? ratingCount = null,Object? isApproved = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,companyName: null == companyName ? _self.companyName : companyName // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as GeoLocation,acceptedCategories: null == acceptedCategories ? _self.acceptedCategories : acceptedCategories // ignore: cast_nullable_to_non_nullable
as List<String>,minWeightKg: null == minWeightKg ? _self.minWeightKg : minWeightKg // ignore: cast_nullable_to_non_nullable
as double,pricePerUnit: null == pricePerUnit ? _self.pricePerUnit : pricePerUnit // ignore: cast_nullable_to_non_nullable
as Map<String, PriceDetail>,hasDrivers: null == hasDrivers ? _self.hasDrivers : hasDrivers // ignore: cast_nullable_to_non_nullable
as bool,driverCapacityKgPerDay: null == driverCapacityKgPerDay ? _self.driverCapacityKgPerDay : driverCapacityKgPerDay // ignore: cast_nullable_to_non_nullable
as double,serviceRadiusKm: null == serviceRadiusKm ? _self.serviceRadiusKm : serviceRadiusKm // ignore: cast_nullable_to_non_nullable
as double,rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double,ratingCount: null == ratingCount ? _self.ratingCount : ratingCount // ignore: cast_nullable_to_non_nullable
as int,isApproved: null == isApproved ? _self.isApproved : isApproved // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of CompanyProfileModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GeoLocationCopyWith<$Res> get location {
  
  return $GeoLocationCopyWith<$Res>(_self.location, (value) {
    return _then(_self.copyWith(location: value));
  });
}
}


/// Adds pattern-matching-related methods to [CompanyProfileModel].
extension CompanyProfileModelPatterns on CompanyProfileModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CompanyProfileModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CompanyProfileModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CompanyProfileModel value)  $default,){
final _that = this;
switch (_that) {
case _CompanyProfileModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CompanyProfileModel value)?  $default,){
final _that = this;
switch (_that) {
case _CompanyProfileModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String companyName,  String description,  GeoLocation location,  List<String> acceptedCategories,  double minWeightKg,  Map<String, PriceDetail> pricePerUnit,  bool hasDrivers,  double driverCapacityKgPerDay,  double serviceRadiusKm,  double rating,  int ratingCount,  bool isApproved)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CompanyProfileModel() when $default != null:
return $default(_that.id,_that.companyName,_that.description,_that.location,_that.acceptedCategories,_that.minWeightKg,_that.pricePerUnit,_that.hasDrivers,_that.driverCapacityKgPerDay,_that.serviceRadiusKm,_that.rating,_that.ratingCount,_that.isApproved);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String companyName,  String description,  GeoLocation location,  List<String> acceptedCategories,  double minWeightKg,  Map<String, PriceDetail> pricePerUnit,  bool hasDrivers,  double driverCapacityKgPerDay,  double serviceRadiusKm,  double rating,  int ratingCount,  bool isApproved)  $default,) {final _that = this;
switch (_that) {
case _CompanyProfileModel():
return $default(_that.id,_that.companyName,_that.description,_that.location,_that.acceptedCategories,_that.minWeightKg,_that.pricePerUnit,_that.hasDrivers,_that.driverCapacityKgPerDay,_that.serviceRadiusKm,_that.rating,_that.ratingCount,_that.isApproved);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String companyName,  String description,  GeoLocation location,  List<String> acceptedCategories,  double minWeightKg,  Map<String, PriceDetail> pricePerUnit,  bool hasDrivers,  double driverCapacityKgPerDay,  double serviceRadiusKm,  double rating,  int ratingCount,  bool isApproved)?  $default,) {final _that = this;
switch (_that) {
case _CompanyProfileModel() when $default != null:
return $default(_that.id,_that.companyName,_that.description,_that.location,_that.acceptedCategories,_that.minWeightKg,_that.pricePerUnit,_that.hasDrivers,_that.driverCapacityKgPerDay,_that.serviceRadiusKm,_that.rating,_that.ratingCount,_that.isApproved);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CompanyProfileModel implements CompanyProfileModel {
  const _CompanyProfileModel({required this.id, required this.companyName, required this.description, required this.location, required final  List<String> acceptedCategories, this.minWeightKg = 0.0, required final  Map<String, PriceDetail> pricePerUnit, this.hasDrivers = false, this.driverCapacityKgPerDay = 0.0, this.serviceRadiusKm = 10.0, this.rating = 5.0, this.ratingCount = 0, this.isApproved = false}): _acceptedCategories = acceptedCategories,_pricePerUnit = pricePerUnit;
  factory _CompanyProfileModel.fromJson(Map<String, dynamic> json) => _$CompanyProfileModelFromJson(json);

@override final  String id;
@override final  String companyName;
@override final  String description;
@override final  GeoLocation location;
 final  List<String> _acceptedCategories;
@override List<String> get acceptedCategories {
  if (_acceptedCategories is EqualUnmodifiableListView) return _acceptedCategories;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_acceptedCategories);
}

@override@JsonKey() final  double minWeightKg;
 final  Map<String, PriceDetail> _pricePerUnit;
@override Map<String, PriceDetail> get pricePerUnit {
  if (_pricePerUnit is EqualUnmodifiableMapView) return _pricePerUnit;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_pricePerUnit);
}

// category -> details
@override@JsonKey() final  bool hasDrivers;
@override@JsonKey() final  double driverCapacityKgPerDay;
@override@JsonKey() final  double serviceRadiusKm;
@override@JsonKey() final  double rating;
@override@JsonKey() final  int ratingCount;
@override@JsonKey() final  bool isApproved;

/// Create a copy of CompanyProfileModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CompanyProfileModelCopyWith<_CompanyProfileModel> get copyWith => __$CompanyProfileModelCopyWithImpl<_CompanyProfileModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CompanyProfileModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CompanyProfileModel&&(identical(other.id, id) || other.id == id)&&(identical(other.companyName, companyName) || other.companyName == companyName)&&(identical(other.description, description) || other.description == description)&&(identical(other.location, location) || other.location == location)&&const DeepCollectionEquality().equals(other._acceptedCategories, _acceptedCategories)&&(identical(other.minWeightKg, minWeightKg) || other.minWeightKg == minWeightKg)&&const DeepCollectionEquality().equals(other._pricePerUnit, _pricePerUnit)&&(identical(other.hasDrivers, hasDrivers) || other.hasDrivers == hasDrivers)&&(identical(other.driverCapacityKgPerDay, driverCapacityKgPerDay) || other.driverCapacityKgPerDay == driverCapacityKgPerDay)&&(identical(other.serviceRadiusKm, serviceRadiusKm) || other.serviceRadiusKm == serviceRadiusKm)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.ratingCount, ratingCount) || other.ratingCount == ratingCount)&&(identical(other.isApproved, isApproved) || other.isApproved == isApproved));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,companyName,description,location,const DeepCollectionEquality().hash(_acceptedCategories),minWeightKg,const DeepCollectionEquality().hash(_pricePerUnit),hasDrivers,driverCapacityKgPerDay,serviceRadiusKm,rating,ratingCount,isApproved);

@override
String toString() {
  return 'CompanyProfileModel(id: $id, companyName: $companyName, description: $description, location: $location, acceptedCategories: $acceptedCategories, minWeightKg: $minWeightKg, pricePerUnit: $pricePerUnit, hasDrivers: $hasDrivers, driverCapacityKgPerDay: $driverCapacityKgPerDay, serviceRadiusKm: $serviceRadiusKm, rating: $rating, ratingCount: $ratingCount, isApproved: $isApproved)';
}


}

/// @nodoc
abstract mixin class _$CompanyProfileModelCopyWith<$Res> implements $CompanyProfileModelCopyWith<$Res> {
  factory _$CompanyProfileModelCopyWith(_CompanyProfileModel value, $Res Function(_CompanyProfileModel) _then) = __$CompanyProfileModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String companyName, String description, GeoLocation location, List<String> acceptedCategories, double minWeightKg, Map<String, PriceDetail> pricePerUnit, bool hasDrivers, double driverCapacityKgPerDay, double serviceRadiusKm, double rating, int ratingCount, bool isApproved
});


@override $GeoLocationCopyWith<$Res> get location;

}
/// @nodoc
class __$CompanyProfileModelCopyWithImpl<$Res>
    implements _$CompanyProfileModelCopyWith<$Res> {
  __$CompanyProfileModelCopyWithImpl(this._self, this._then);

  final _CompanyProfileModel _self;
  final $Res Function(_CompanyProfileModel) _then;

/// Create a copy of CompanyProfileModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? companyName = null,Object? description = null,Object? location = null,Object? acceptedCategories = null,Object? minWeightKg = null,Object? pricePerUnit = null,Object? hasDrivers = null,Object? driverCapacityKgPerDay = null,Object? serviceRadiusKm = null,Object? rating = null,Object? ratingCount = null,Object? isApproved = null,}) {
  return _then(_CompanyProfileModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,companyName: null == companyName ? _self.companyName : companyName // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as GeoLocation,acceptedCategories: null == acceptedCategories ? _self._acceptedCategories : acceptedCategories // ignore: cast_nullable_to_non_nullable
as List<String>,minWeightKg: null == minWeightKg ? _self.minWeightKg : minWeightKg // ignore: cast_nullable_to_non_nullable
as double,pricePerUnit: null == pricePerUnit ? _self._pricePerUnit : pricePerUnit // ignore: cast_nullable_to_non_nullable
as Map<String, PriceDetail>,hasDrivers: null == hasDrivers ? _self.hasDrivers : hasDrivers // ignore: cast_nullable_to_non_nullable
as bool,driverCapacityKgPerDay: null == driverCapacityKgPerDay ? _self.driverCapacityKgPerDay : driverCapacityKgPerDay // ignore: cast_nullable_to_non_nullable
as double,serviceRadiusKm: null == serviceRadiusKm ? _self.serviceRadiusKm : serviceRadiusKm // ignore: cast_nullable_to_non_nullable
as double,rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double,ratingCount: null == ratingCount ? _self.ratingCount : ratingCount // ignore: cast_nullable_to_non_nullable
as int,isApproved: null == isApproved ? _self.isApproved : isApproved // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of CompanyProfileModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GeoLocationCopyWith<$Res> get location {
  
  return $GeoLocationCopyWith<$Res>(_self.location, (value) {
    return _then(_self.copyWith(location: value));
  });
}
}

// dart format on
