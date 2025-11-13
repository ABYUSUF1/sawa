// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'complete_profile_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CompleteProfileState {

 bool get isLoading; String? get error; bool get success; File? get pickedImageFile; UserEntity? get updatedUser;
/// Create a copy of CompleteProfileState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CompleteProfileStateCopyWith<CompleteProfileState> get copyWith => _$CompleteProfileStateCopyWithImpl<CompleteProfileState>(this as CompleteProfileState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CompleteProfileState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.error, error) || other.error == error)&&(identical(other.success, success) || other.success == success)&&(identical(other.pickedImageFile, pickedImageFile) || other.pickedImageFile == pickedImageFile)&&(identical(other.updatedUser, updatedUser) || other.updatedUser == updatedUser));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,error,success,pickedImageFile,updatedUser);

@override
String toString() {
  return 'CompleteProfileState(isLoading: $isLoading, error: $error, success: $success, pickedImageFile: $pickedImageFile, updatedUser: $updatedUser)';
}


}

/// @nodoc
abstract mixin class $CompleteProfileStateCopyWith<$Res>  {
  factory $CompleteProfileStateCopyWith(CompleteProfileState value, $Res Function(CompleteProfileState) _then) = _$CompleteProfileStateCopyWithImpl;
@useResult
$Res call({
 bool isLoading, String? error, bool success, File? pickedImageFile, UserEntity? updatedUser
});




}
/// @nodoc
class _$CompleteProfileStateCopyWithImpl<$Res>
    implements $CompleteProfileStateCopyWith<$Res> {
  _$CompleteProfileStateCopyWithImpl(this._self, this._then);

  final CompleteProfileState _self;
  final $Res Function(CompleteProfileState) _then;

/// Create a copy of CompleteProfileState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isLoading = null,Object? error = freezed,Object? success = null,Object? pickedImageFile = freezed,Object? updatedUser = freezed,}) {
  return _then(_self.copyWith(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,pickedImageFile: freezed == pickedImageFile ? _self.pickedImageFile : pickedImageFile // ignore: cast_nullable_to_non_nullable
as File?,updatedUser: freezed == updatedUser ? _self.updatedUser : updatedUser // ignore: cast_nullable_to_non_nullable
as UserEntity?,
  ));
}

}


/// Adds pattern-matching-related methods to [CompleteProfileState].
extension CompleteProfileStatePatterns on CompleteProfileState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CompleteProfileState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CompleteProfileState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CompleteProfileState value)  $default,){
final _that = this;
switch (_that) {
case _CompleteProfileState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CompleteProfileState value)?  $default,){
final _that = this;
switch (_that) {
case _CompleteProfileState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isLoading,  String? error,  bool success,  File? pickedImageFile,  UserEntity? updatedUser)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CompleteProfileState() when $default != null:
return $default(_that.isLoading,_that.error,_that.success,_that.pickedImageFile,_that.updatedUser);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isLoading,  String? error,  bool success,  File? pickedImageFile,  UserEntity? updatedUser)  $default,) {final _that = this;
switch (_that) {
case _CompleteProfileState():
return $default(_that.isLoading,_that.error,_that.success,_that.pickedImageFile,_that.updatedUser);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isLoading,  String? error,  bool success,  File? pickedImageFile,  UserEntity? updatedUser)?  $default,) {final _that = this;
switch (_that) {
case _CompleteProfileState() when $default != null:
return $default(_that.isLoading,_that.error,_that.success,_that.pickedImageFile,_that.updatedUser);case _:
  return null;

}
}

}

/// @nodoc


class _CompleteProfileState implements CompleteProfileState {
  const _CompleteProfileState({this.isLoading = false, this.error, this.success = false, this.pickedImageFile, this.updatedUser});
  

@override@JsonKey() final  bool isLoading;
@override final  String? error;
@override@JsonKey() final  bool success;
@override final  File? pickedImageFile;
@override final  UserEntity? updatedUser;

/// Create a copy of CompleteProfileState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CompleteProfileStateCopyWith<_CompleteProfileState> get copyWith => __$CompleteProfileStateCopyWithImpl<_CompleteProfileState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CompleteProfileState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.error, error) || other.error == error)&&(identical(other.success, success) || other.success == success)&&(identical(other.pickedImageFile, pickedImageFile) || other.pickedImageFile == pickedImageFile)&&(identical(other.updatedUser, updatedUser) || other.updatedUser == updatedUser));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,error,success,pickedImageFile,updatedUser);

@override
String toString() {
  return 'CompleteProfileState(isLoading: $isLoading, error: $error, success: $success, pickedImageFile: $pickedImageFile, updatedUser: $updatedUser)';
}


}

/// @nodoc
abstract mixin class _$CompleteProfileStateCopyWith<$Res> implements $CompleteProfileStateCopyWith<$Res> {
  factory _$CompleteProfileStateCopyWith(_CompleteProfileState value, $Res Function(_CompleteProfileState) _then) = __$CompleteProfileStateCopyWithImpl;
@override @useResult
$Res call({
 bool isLoading, String? error, bool success, File? pickedImageFile, UserEntity? updatedUser
});




}
/// @nodoc
class __$CompleteProfileStateCopyWithImpl<$Res>
    implements _$CompleteProfileStateCopyWith<$Res> {
  __$CompleteProfileStateCopyWithImpl(this._self, this._then);

  final _CompleteProfileState _self;
  final $Res Function(_CompleteProfileState) _then;

/// Create a copy of CompleteProfileState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isLoading = null,Object? error = freezed,Object? success = null,Object? pickedImageFile = freezed,Object? updatedUser = freezed,}) {
  return _then(_CompleteProfileState(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,pickedImageFile: freezed == pickedImageFile ? _self.pickedImageFile : pickedImageFile // ignore: cast_nullable_to_non_nullable
as File?,updatedUser: freezed == updatedUser ? _self.updatedUser : updatedUser // ignore: cast_nullable_to_non_nullable
as UserEntity?,
  ));
}


}

// dart format on
