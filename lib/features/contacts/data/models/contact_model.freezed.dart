// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'contact_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ContactModel {

 String get contactName; String get phoneNumber; bool get isAppUser; UserModel? get user;
/// Create a copy of ContactModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ContactModelCopyWith<ContactModel> get copyWith => _$ContactModelCopyWithImpl<ContactModel>(this as ContactModel, _$identity);

  /// Serializes this ContactModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ContactModel&&(identical(other.contactName, contactName) || other.contactName == contactName)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.isAppUser, isAppUser) || other.isAppUser == isAppUser)&&(identical(other.user, user) || other.user == user));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,contactName,phoneNumber,isAppUser,user);

@override
String toString() {
  return 'ContactModel(contactName: $contactName, phoneNumber: $phoneNumber, isAppUser: $isAppUser, user: $user)';
}


}

/// @nodoc
abstract mixin class $ContactModelCopyWith<$Res>  {
  factory $ContactModelCopyWith(ContactModel value, $Res Function(ContactModel) _then) = _$ContactModelCopyWithImpl;
@useResult
$Res call({
 String contactName, String phoneNumber, bool isAppUser, UserModel? user
});


$UserModelCopyWith<$Res>? get user;

}
/// @nodoc
class _$ContactModelCopyWithImpl<$Res>
    implements $ContactModelCopyWith<$Res> {
  _$ContactModelCopyWithImpl(this._self, this._then);

  final ContactModel _self;
  final $Res Function(ContactModel) _then;

/// Create a copy of ContactModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? contactName = null,Object? phoneNumber = null,Object? isAppUser = null,Object? user = freezed,}) {
  return _then(_self.copyWith(
contactName: null == contactName ? _self.contactName : contactName // ignore: cast_nullable_to_non_nullable
as String,phoneNumber: null == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String,isAppUser: null == isAppUser ? _self.isAppUser : isAppUser // ignore: cast_nullable_to_non_nullable
as bool,user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as UserModel?,
  ));
}
/// Create a copy of ContactModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserModelCopyWith<$Res>? get user {
    if (_self.user == null) {
    return null;
  }

  return $UserModelCopyWith<$Res>(_self.user!, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}


/// Adds pattern-matching-related methods to [ContactModel].
extension ContactModelPatterns on ContactModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ContactModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ContactModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ContactModel value)  $default,){
final _that = this;
switch (_that) {
case _ContactModel():
return $default(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ContactModel value)?  $default,){
final _that = this;
switch (_that) {
case _ContactModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String contactName,  String phoneNumber,  bool isAppUser,  UserModel? user)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ContactModel() when $default != null:
return $default(_that.contactName,_that.phoneNumber,_that.isAppUser,_that.user);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String contactName,  String phoneNumber,  bool isAppUser,  UserModel? user)  $default,) {final _that = this;
switch (_that) {
case _ContactModel():
return $default(_that.contactName,_that.phoneNumber,_that.isAppUser,_that.user);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String contactName,  String phoneNumber,  bool isAppUser,  UserModel? user)?  $default,) {final _that = this;
switch (_that) {
case _ContactModel() when $default != null:
return $default(_that.contactName,_that.phoneNumber,_that.isAppUser,_that.user);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ContactModel implements ContactModel {
  const _ContactModel({required this.contactName, required this.phoneNumber, required this.isAppUser, this.user});
  factory _ContactModel.fromJson(Map<String, dynamic> json) => _$ContactModelFromJson(json);

@override final  String contactName;
@override final  String phoneNumber;
@override final  bool isAppUser;
@override final  UserModel? user;

/// Create a copy of ContactModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ContactModelCopyWith<_ContactModel> get copyWith => __$ContactModelCopyWithImpl<_ContactModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ContactModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ContactModel&&(identical(other.contactName, contactName) || other.contactName == contactName)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.isAppUser, isAppUser) || other.isAppUser == isAppUser)&&(identical(other.user, user) || other.user == user));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,contactName,phoneNumber,isAppUser,user);

@override
String toString() {
  return 'ContactModel(contactName: $contactName, phoneNumber: $phoneNumber, isAppUser: $isAppUser, user: $user)';
}


}

/// @nodoc
abstract mixin class _$ContactModelCopyWith<$Res> implements $ContactModelCopyWith<$Res> {
  factory _$ContactModelCopyWith(_ContactModel value, $Res Function(_ContactModel) _then) = __$ContactModelCopyWithImpl;
@override @useResult
$Res call({
 String contactName, String phoneNumber, bool isAppUser, UserModel? user
});


@override $UserModelCopyWith<$Res>? get user;

}
/// @nodoc
class __$ContactModelCopyWithImpl<$Res>
    implements _$ContactModelCopyWith<$Res> {
  __$ContactModelCopyWithImpl(this._self, this._then);

  final _ContactModel _self;
  final $Res Function(_ContactModel) _then;

/// Create a copy of ContactModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? contactName = null,Object? phoneNumber = null,Object? isAppUser = null,Object? user = freezed,}) {
  return _then(_ContactModel(
contactName: null == contactName ? _self.contactName : contactName // ignore: cast_nullable_to_non_nullable
as String,phoneNumber: null == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String,isAppUser: null == isAppUser ? _self.isAppUser : isAppUser // ignore: cast_nullable_to_non_nullable
as bool,user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as UserModel?,
  ));
}

/// Create a copy of ContactModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserModelCopyWith<$Res>? get user {
    if (_self.user == null) {
    return null;
  }

  return $UserModelCopyWith<$Res>(_self.user!, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}

// dart format on
