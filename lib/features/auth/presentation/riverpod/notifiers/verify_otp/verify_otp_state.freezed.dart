// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'verify_otp_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$VerifyOtpState {

 String? get error; bool get success; int? get secondsRemaining; bool get isResending; bool get isVerifying; UserEntity? get user;
/// Create a copy of VerifyOtpState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VerifyOtpStateCopyWith<VerifyOtpState> get copyWith => _$VerifyOtpStateCopyWithImpl<VerifyOtpState>(this as VerifyOtpState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VerifyOtpState&&(identical(other.error, error) || other.error == error)&&(identical(other.success, success) || other.success == success)&&(identical(other.secondsRemaining, secondsRemaining) || other.secondsRemaining == secondsRemaining)&&(identical(other.isResending, isResending) || other.isResending == isResending)&&(identical(other.isVerifying, isVerifying) || other.isVerifying == isVerifying)&&(identical(other.user, user) || other.user == user));
}


@override
int get hashCode => Object.hash(runtimeType,error,success,secondsRemaining,isResending,isVerifying,user);

@override
String toString() {
  return 'VerifyOtpState(error: $error, success: $success, secondsRemaining: $secondsRemaining, isResending: $isResending, isVerifying: $isVerifying, user: $user)';
}


}

/// @nodoc
abstract mixin class $VerifyOtpStateCopyWith<$Res>  {
  factory $VerifyOtpStateCopyWith(VerifyOtpState value, $Res Function(VerifyOtpState) _then) = _$VerifyOtpStateCopyWithImpl;
@useResult
$Res call({
 String? error, bool success, int? secondsRemaining, bool isResending, bool isVerifying, UserEntity? user
});




}
/// @nodoc
class _$VerifyOtpStateCopyWithImpl<$Res>
    implements $VerifyOtpStateCopyWith<$Res> {
  _$VerifyOtpStateCopyWithImpl(this._self, this._then);

  final VerifyOtpState _self;
  final $Res Function(VerifyOtpState) _then;

/// Create a copy of VerifyOtpState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? error = freezed,Object? success = null,Object? secondsRemaining = freezed,Object? isResending = null,Object? isVerifying = null,Object? user = freezed,}) {
  return _then(_self.copyWith(
error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,secondsRemaining: freezed == secondsRemaining ? _self.secondsRemaining : secondsRemaining // ignore: cast_nullable_to_non_nullable
as int?,isResending: null == isResending ? _self.isResending : isResending // ignore: cast_nullable_to_non_nullable
as bool,isVerifying: null == isVerifying ? _self.isVerifying : isVerifying // ignore: cast_nullable_to_non_nullable
as bool,user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as UserEntity?,
  ));
}

}


/// Adds pattern-matching-related methods to [VerifyOtpState].
extension VerifyOtpStatePatterns on VerifyOtpState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VerifyOtpState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VerifyOtpState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VerifyOtpState value)  $default,){
final _that = this;
switch (_that) {
case _VerifyOtpState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VerifyOtpState value)?  $default,){
final _that = this;
switch (_that) {
case _VerifyOtpState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? error,  bool success,  int? secondsRemaining,  bool isResending,  bool isVerifying,  UserEntity? user)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VerifyOtpState() when $default != null:
return $default(_that.error,_that.success,_that.secondsRemaining,_that.isResending,_that.isVerifying,_that.user);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? error,  bool success,  int? secondsRemaining,  bool isResending,  bool isVerifying,  UserEntity? user)  $default,) {final _that = this;
switch (_that) {
case _VerifyOtpState():
return $default(_that.error,_that.success,_that.secondsRemaining,_that.isResending,_that.isVerifying,_that.user);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? error,  bool success,  int? secondsRemaining,  bool isResending,  bool isVerifying,  UserEntity? user)?  $default,) {final _that = this;
switch (_that) {
case _VerifyOtpState() when $default != null:
return $default(_that.error,_that.success,_that.secondsRemaining,_that.isResending,_that.isVerifying,_that.user);case _:
  return null;

}
}

}

/// @nodoc


class _VerifyOtpState implements VerifyOtpState {
  const _VerifyOtpState({this.error, this.success = false, this.secondsRemaining, this.isResending = false, this.isVerifying = false, this.user});
  

@override final  String? error;
@override@JsonKey() final  bool success;
@override final  int? secondsRemaining;
@override@JsonKey() final  bool isResending;
@override@JsonKey() final  bool isVerifying;
@override final  UserEntity? user;

/// Create a copy of VerifyOtpState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VerifyOtpStateCopyWith<_VerifyOtpState> get copyWith => __$VerifyOtpStateCopyWithImpl<_VerifyOtpState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VerifyOtpState&&(identical(other.error, error) || other.error == error)&&(identical(other.success, success) || other.success == success)&&(identical(other.secondsRemaining, secondsRemaining) || other.secondsRemaining == secondsRemaining)&&(identical(other.isResending, isResending) || other.isResending == isResending)&&(identical(other.isVerifying, isVerifying) || other.isVerifying == isVerifying)&&(identical(other.user, user) || other.user == user));
}


@override
int get hashCode => Object.hash(runtimeType,error,success,secondsRemaining,isResending,isVerifying,user);

@override
String toString() {
  return 'VerifyOtpState(error: $error, success: $success, secondsRemaining: $secondsRemaining, isResending: $isResending, isVerifying: $isVerifying, user: $user)';
}


}

/// @nodoc
abstract mixin class _$VerifyOtpStateCopyWith<$Res> implements $VerifyOtpStateCopyWith<$Res> {
  factory _$VerifyOtpStateCopyWith(_VerifyOtpState value, $Res Function(_VerifyOtpState) _then) = __$VerifyOtpStateCopyWithImpl;
@override @useResult
$Res call({
 String? error, bool success, int? secondsRemaining, bool isResending, bool isVerifying, UserEntity? user
});




}
/// @nodoc
class __$VerifyOtpStateCopyWithImpl<$Res>
    implements _$VerifyOtpStateCopyWith<$Res> {
  __$VerifyOtpStateCopyWithImpl(this._self, this._then);

  final _VerifyOtpState _self;
  final $Res Function(_VerifyOtpState) _then;

/// Create a copy of VerifyOtpState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? error = freezed,Object? success = null,Object? secondsRemaining = freezed,Object? isResending = null,Object? isVerifying = null,Object? user = freezed,}) {
  return _then(_VerifyOtpState(
error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,secondsRemaining: freezed == secondsRemaining ? _self.secondsRemaining : secondsRemaining // ignore: cast_nullable_to_non_nullable
as int?,isResending: null == isResending ? _self.isResending : isResending // ignore: cast_nullable_to_non_nullable
as bool,isVerifying: null == isVerifying ? _self.isVerifying : isVerifying // ignore: cast_nullable_to_non_nullable
as bool,user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as UserEntity?,
  ));
}


}

// dart format on
