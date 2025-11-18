// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'contacts_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ContactsState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ContactsState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ContactsState()';
}


}

/// @nodoc
class $ContactsStateCopyWith<$Res>  {
$ContactsStateCopyWith(ContactsState _, $Res Function(ContactsState) __);
}


/// Adds pattern-matching-related methods to [ContactsState].
extension ContactsStatePatterns on ContactsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Loading value)?  loading,TResult Function( ContactsSuccess value)?  success,TResult Function( _Error value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Loading() when loading != null:
return loading(_that);case ContactsSuccess() when success != null:
return success(_that);case _Error() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Loading value)  loading,required TResult Function( ContactsSuccess value)  success,required TResult Function( _Error value)  error,}){
final _that = this;
switch (_that) {
case _Loading():
return loading(_that);case ContactsSuccess():
return success(_that);case _Error():
return error(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Loading value)?  loading,TResult? Function( ContactsSuccess value)?  success,TResult? Function( _Error value)?  error,}){
final _that = this;
switch (_that) {
case _Loading() when loading != null:
return loading(_that);case ContactsSuccess() when success != null:
return success(_that);case _Error() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loading,TResult Function( List<ContactEntity> appUserContacts,  String searchQuery,  List<ContactEntity> filteredAppUsers,  List<ContactEntity> filteredNonAppUsers)?  success,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Loading() when loading != null:
return loading();case ContactsSuccess() when success != null:
return success(_that.appUserContacts,_that.searchQuery,_that.filteredAppUsers,_that.filteredNonAppUsers);case _Error() when error != null:
return error(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loading,required TResult Function( List<ContactEntity> appUserContacts,  String searchQuery,  List<ContactEntity> filteredAppUsers,  List<ContactEntity> filteredNonAppUsers)  success,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case _Loading():
return loading();case ContactsSuccess():
return success(_that.appUserContacts,_that.searchQuery,_that.filteredAppUsers,_that.filteredNonAppUsers);case _Error():
return error(_that.message);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loading,TResult? Function( List<ContactEntity> appUserContacts,  String searchQuery,  List<ContactEntity> filteredAppUsers,  List<ContactEntity> filteredNonAppUsers)?  success,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case _Loading() when loading != null:
return loading();case ContactsSuccess() when success != null:
return success(_that.appUserContacts,_that.searchQuery,_that.filteredAppUsers,_that.filteredNonAppUsers);case _Error() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _Loading implements ContactsState {
  const _Loading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ContactsState.loading()';
}


}




/// @nodoc


class ContactsSuccess implements ContactsState {
  const ContactsSuccess({required final  List<ContactEntity> appUserContacts, this.searchQuery = '', final  List<ContactEntity> filteredAppUsers = const [], final  List<ContactEntity> filteredNonAppUsers = const []}): _appUserContacts = appUserContacts,_filteredAppUsers = filteredAppUsers,_filteredNonAppUsers = filteredNonAppUsers;
  

 final  List<ContactEntity> _appUserContacts;
 List<ContactEntity> get appUserContacts {
  if (_appUserContacts is EqualUnmodifiableListView) return _appUserContacts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_appUserContacts);
}

@JsonKey() final  String searchQuery;
 final  List<ContactEntity> _filteredAppUsers;
@JsonKey() List<ContactEntity> get filteredAppUsers {
  if (_filteredAppUsers is EqualUnmodifiableListView) return _filteredAppUsers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_filteredAppUsers);
}

 final  List<ContactEntity> _filteredNonAppUsers;
@JsonKey() List<ContactEntity> get filteredNonAppUsers {
  if (_filteredNonAppUsers is EqualUnmodifiableListView) return _filteredNonAppUsers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_filteredNonAppUsers);
}


/// Create a copy of ContactsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ContactsSuccessCopyWith<ContactsSuccess> get copyWith => _$ContactsSuccessCopyWithImpl<ContactsSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ContactsSuccess&&const DeepCollectionEquality().equals(other._appUserContacts, _appUserContacts)&&(identical(other.searchQuery, searchQuery) || other.searchQuery == searchQuery)&&const DeepCollectionEquality().equals(other._filteredAppUsers, _filteredAppUsers)&&const DeepCollectionEquality().equals(other._filteredNonAppUsers, _filteredNonAppUsers));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_appUserContacts),searchQuery,const DeepCollectionEquality().hash(_filteredAppUsers),const DeepCollectionEquality().hash(_filteredNonAppUsers));

@override
String toString() {
  return 'ContactsState.success(appUserContacts: $appUserContacts, searchQuery: $searchQuery, filteredAppUsers: $filteredAppUsers, filteredNonAppUsers: $filteredNonAppUsers)';
}


}

/// @nodoc
abstract mixin class $ContactsSuccessCopyWith<$Res> implements $ContactsStateCopyWith<$Res> {
  factory $ContactsSuccessCopyWith(ContactsSuccess value, $Res Function(ContactsSuccess) _then) = _$ContactsSuccessCopyWithImpl;
@useResult
$Res call({
 List<ContactEntity> appUserContacts, String searchQuery, List<ContactEntity> filteredAppUsers, List<ContactEntity> filteredNonAppUsers
});




}
/// @nodoc
class _$ContactsSuccessCopyWithImpl<$Res>
    implements $ContactsSuccessCopyWith<$Res> {
  _$ContactsSuccessCopyWithImpl(this._self, this._then);

  final ContactsSuccess _self;
  final $Res Function(ContactsSuccess) _then;

/// Create a copy of ContactsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? appUserContacts = null,Object? searchQuery = null,Object? filteredAppUsers = null,Object? filteredNonAppUsers = null,}) {
  return _then(ContactsSuccess(
appUserContacts: null == appUserContacts ? _self._appUserContacts : appUserContacts // ignore: cast_nullable_to_non_nullable
as List<ContactEntity>,searchQuery: null == searchQuery ? _self.searchQuery : searchQuery // ignore: cast_nullable_to_non_nullable
as String,filteredAppUsers: null == filteredAppUsers ? _self._filteredAppUsers : filteredAppUsers // ignore: cast_nullable_to_non_nullable
as List<ContactEntity>,filteredNonAppUsers: null == filteredNonAppUsers ? _self._filteredNonAppUsers : filteredNonAppUsers // ignore: cast_nullable_to_non_nullable
as List<ContactEntity>,
  ));
}


}

/// @nodoc


class _Error implements ContactsState {
  const _Error(this.message);
  

 final  String message;

/// Create a copy of ContactsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ErrorCopyWith<_Error> get copyWith => __$ErrorCopyWithImpl<_Error>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Error&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'ContactsState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class _$ErrorCopyWith<$Res> implements $ContactsStateCopyWith<$Res> {
  factory _$ErrorCopyWith(_Error value, $Res Function(_Error) _then) = __$ErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class __$ErrorCopyWithImpl<$Res>
    implements _$ErrorCopyWith<$Res> {
  __$ErrorCopyWithImpl(this._self, this._then);

  final _Error _self;
  final $Res Function(_Error) _then;

/// Create a copy of ContactsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_Error(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
