// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_room_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ChatRoomModel {

 String get id; String get name; String? get description; String? get imageUrl; ChatRoomType get type;// members
 List<String> get memberIds; Map<String, String> get memberNames; Map<String, String> get memberAvatars; List<String>? get adminIds;// Last message info
 String? get lastMessageId; String? get lastMessagePreview; String? get lastMessageSenderId; MessageType? get lastMessageType; DateTime? get lastMessageAt; int get unreadCount;// Settings & Permissions
 bool get isArchived; bool get isMuted;// Metadata
 String get createdBy; DateTime get createdAt; DateTime? get updatedAt;// For direct chats
 String? get otherUserId;
/// Create a copy of ChatRoomModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChatRoomModelCopyWith<ChatRoomModel> get copyWith => _$ChatRoomModelCopyWithImpl<ChatRoomModel>(this as ChatRoomModel, _$identity);

  /// Serializes this ChatRoomModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatRoomModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.type, type) || other.type == type)&&const DeepCollectionEquality().equals(other.memberIds, memberIds)&&const DeepCollectionEquality().equals(other.memberNames, memberNames)&&const DeepCollectionEquality().equals(other.memberAvatars, memberAvatars)&&const DeepCollectionEquality().equals(other.adminIds, adminIds)&&(identical(other.lastMessageId, lastMessageId) || other.lastMessageId == lastMessageId)&&(identical(other.lastMessagePreview, lastMessagePreview) || other.lastMessagePreview == lastMessagePreview)&&(identical(other.lastMessageSenderId, lastMessageSenderId) || other.lastMessageSenderId == lastMessageSenderId)&&(identical(other.lastMessageType, lastMessageType) || other.lastMessageType == lastMessageType)&&(identical(other.lastMessageAt, lastMessageAt) || other.lastMessageAt == lastMessageAt)&&(identical(other.unreadCount, unreadCount) || other.unreadCount == unreadCount)&&(identical(other.isArchived, isArchived) || other.isArchived == isArchived)&&(identical(other.isMuted, isMuted) || other.isMuted == isMuted)&&(identical(other.createdBy, createdBy) || other.createdBy == createdBy)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.otherUserId, otherUserId) || other.otherUserId == otherUserId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,name,description,imageUrl,type,const DeepCollectionEquality().hash(memberIds),const DeepCollectionEquality().hash(memberNames),const DeepCollectionEquality().hash(memberAvatars),const DeepCollectionEquality().hash(adminIds),lastMessageId,lastMessagePreview,lastMessageSenderId,lastMessageType,lastMessageAt,unreadCount,isArchived,isMuted,createdBy,createdAt,updatedAt,otherUserId]);

@override
String toString() {
  return 'ChatRoomModel(id: $id, name: $name, description: $description, imageUrl: $imageUrl, type: $type, memberIds: $memberIds, memberNames: $memberNames, memberAvatars: $memberAvatars, adminIds: $adminIds, lastMessageId: $lastMessageId, lastMessagePreview: $lastMessagePreview, lastMessageSenderId: $lastMessageSenderId, lastMessageType: $lastMessageType, lastMessageAt: $lastMessageAt, unreadCount: $unreadCount, isArchived: $isArchived, isMuted: $isMuted, createdBy: $createdBy, createdAt: $createdAt, updatedAt: $updatedAt, otherUserId: $otherUserId)';
}


}

/// @nodoc
abstract mixin class $ChatRoomModelCopyWith<$Res>  {
  factory $ChatRoomModelCopyWith(ChatRoomModel value, $Res Function(ChatRoomModel) _then) = _$ChatRoomModelCopyWithImpl;
@useResult
$Res call({
 String id, String name, String? description, String? imageUrl, ChatRoomType type, List<String> memberIds, Map<String, String> memberNames, Map<String, String> memberAvatars, List<String>? adminIds, String? lastMessageId, String? lastMessagePreview, String? lastMessageSenderId, MessageType? lastMessageType, DateTime? lastMessageAt, int unreadCount, bool isArchived, bool isMuted, String createdBy, DateTime createdAt, DateTime? updatedAt, String? otherUserId
});




}
/// @nodoc
class _$ChatRoomModelCopyWithImpl<$Res>
    implements $ChatRoomModelCopyWith<$Res> {
  _$ChatRoomModelCopyWithImpl(this._self, this._then);

  final ChatRoomModel _self;
  final $Res Function(ChatRoomModel) _then;

/// Create a copy of ChatRoomModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? description = freezed,Object? imageUrl = freezed,Object? type = null,Object? memberIds = null,Object? memberNames = null,Object? memberAvatars = null,Object? adminIds = freezed,Object? lastMessageId = freezed,Object? lastMessagePreview = freezed,Object? lastMessageSenderId = freezed,Object? lastMessageType = freezed,Object? lastMessageAt = freezed,Object? unreadCount = null,Object? isArchived = null,Object? isMuted = null,Object? createdBy = null,Object? createdAt = null,Object? updatedAt = freezed,Object? otherUserId = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as ChatRoomType,memberIds: null == memberIds ? _self.memberIds : memberIds // ignore: cast_nullable_to_non_nullable
as List<String>,memberNames: null == memberNames ? _self.memberNames : memberNames // ignore: cast_nullable_to_non_nullable
as Map<String, String>,memberAvatars: null == memberAvatars ? _self.memberAvatars : memberAvatars // ignore: cast_nullable_to_non_nullable
as Map<String, String>,adminIds: freezed == adminIds ? _self.adminIds : adminIds // ignore: cast_nullable_to_non_nullable
as List<String>?,lastMessageId: freezed == lastMessageId ? _self.lastMessageId : lastMessageId // ignore: cast_nullable_to_non_nullable
as String?,lastMessagePreview: freezed == lastMessagePreview ? _self.lastMessagePreview : lastMessagePreview // ignore: cast_nullable_to_non_nullable
as String?,lastMessageSenderId: freezed == lastMessageSenderId ? _self.lastMessageSenderId : lastMessageSenderId // ignore: cast_nullable_to_non_nullable
as String?,lastMessageType: freezed == lastMessageType ? _self.lastMessageType : lastMessageType // ignore: cast_nullable_to_non_nullable
as MessageType?,lastMessageAt: freezed == lastMessageAt ? _self.lastMessageAt : lastMessageAt // ignore: cast_nullable_to_non_nullable
as DateTime?,unreadCount: null == unreadCount ? _self.unreadCount : unreadCount // ignore: cast_nullable_to_non_nullable
as int,isArchived: null == isArchived ? _self.isArchived : isArchived // ignore: cast_nullable_to_non_nullable
as bool,isMuted: null == isMuted ? _self.isMuted : isMuted // ignore: cast_nullable_to_non_nullable
as bool,createdBy: null == createdBy ? _self.createdBy : createdBy // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,otherUserId: freezed == otherUserId ? _self.otherUserId : otherUserId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ChatRoomModel].
extension ChatRoomModelPatterns on ChatRoomModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChatRoomModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChatRoomModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChatRoomModel value)  $default,){
final _that = this;
switch (_that) {
case _ChatRoomModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChatRoomModel value)?  $default,){
final _that = this;
switch (_that) {
case _ChatRoomModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String? description,  String? imageUrl,  ChatRoomType type,  List<String> memberIds,  Map<String, String> memberNames,  Map<String, String> memberAvatars,  List<String>? adminIds,  String? lastMessageId,  String? lastMessagePreview,  String? lastMessageSenderId,  MessageType? lastMessageType,  DateTime? lastMessageAt,  int unreadCount,  bool isArchived,  bool isMuted,  String createdBy,  DateTime createdAt,  DateTime? updatedAt,  String? otherUserId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChatRoomModel() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.imageUrl,_that.type,_that.memberIds,_that.memberNames,_that.memberAvatars,_that.adminIds,_that.lastMessageId,_that.lastMessagePreview,_that.lastMessageSenderId,_that.lastMessageType,_that.lastMessageAt,_that.unreadCount,_that.isArchived,_that.isMuted,_that.createdBy,_that.createdAt,_that.updatedAt,_that.otherUserId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String? description,  String? imageUrl,  ChatRoomType type,  List<String> memberIds,  Map<String, String> memberNames,  Map<String, String> memberAvatars,  List<String>? adminIds,  String? lastMessageId,  String? lastMessagePreview,  String? lastMessageSenderId,  MessageType? lastMessageType,  DateTime? lastMessageAt,  int unreadCount,  bool isArchived,  bool isMuted,  String createdBy,  DateTime createdAt,  DateTime? updatedAt,  String? otherUserId)  $default,) {final _that = this;
switch (_that) {
case _ChatRoomModel():
return $default(_that.id,_that.name,_that.description,_that.imageUrl,_that.type,_that.memberIds,_that.memberNames,_that.memberAvatars,_that.adminIds,_that.lastMessageId,_that.lastMessagePreview,_that.lastMessageSenderId,_that.lastMessageType,_that.lastMessageAt,_that.unreadCount,_that.isArchived,_that.isMuted,_that.createdBy,_that.createdAt,_that.updatedAt,_that.otherUserId);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String? description,  String? imageUrl,  ChatRoomType type,  List<String> memberIds,  Map<String, String> memberNames,  Map<String, String> memberAvatars,  List<String>? adminIds,  String? lastMessageId,  String? lastMessagePreview,  String? lastMessageSenderId,  MessageType? lastMessageType,  DateTime? lastMessageAt,  int unreadCount,  bool isArchived,  bool isMuted,  String createdBy,  DateTime createdAt,  DateTime? updatedAt,  String? otherUserId)?  $default,) {final _that = this;
switch (_that) {
case _ChatRoomModel() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.imageUrl,_that.type,_that.memberIds,_that.memberNames,_that.memberAvatars,_that.adminIds,_that.lastMessageId,_that.lastMessagePreview,_that.lastMessageSenderId,_that.lastMessageType,_that.lastMessageAt,_that.unreadCount,_that.isArchived,_that.isMuted,_that.createdBy,_that.createdAt,_that.updatedAt,_that.otherUserId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ChatRoomModel implements ChatRoomModel {
  const _ChatRoomModel({required this.id, required this.name, this.description, this.imageUrl, required this.type, required final  List<String> memberIds, final  Map<String, String> memberNames = const {}, final  Map<String, String> memberAvatars = const {}, final  List<String>? adminIds, this.lastMessageId, this.lastMessagePreview, this.lastMessageSenderId, this.lastMessageType, this.lastMessageAt, this.unreadCount = 0, this.isArchived = false, this.isMuted = false, required this.createdBy, required this.createdAt, this.updatedAt, this.otherUserId}): _memberIds = memberIds,_memberNames = memberNames,_memberAvatars = memberAvatars,_adminIds = adminIds;
  factory _ChatRoomModel.fromJson(Map<String, dynamic> json) => _$ChatRoomModelFromJson(json);

@override final  String id;
@override final  String name;
@override final  String? description;
@override final  String? imageUrl;
@override final  ChatRoomType type;
// members
 final  List<String> _memberIds;
// members
@override List<String> get memberIds {
  if (_memberIds is EqualUnmodifiableListView) return _memberIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_memberIds);
}

 final  Map<String, String> _memberNames;
@override@JsonKey() Map<String, String> get memberNames {
  if (_memberNames is EqualUnmodifiableMapView) return _memberNames;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_memberNames);
}

 final  Map<String, String> _memberAvatars;
@override@JsonKey() Map<String, String> get memberAvatars {
  if (_memberAvatars is EqualUnmodifiableMapView) return _memberAvatars;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_memberAvatars);
}

 final  List<String>? _adminIds;
@override List<String>? get adminIds {
  final value = _adminIds;
  if (value == null) return null;
  if (_adminIds is EqualUnmodifiableListView) return _adminIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

// Last message info
@override final  String? lastMessageId;
@override final  String? lastMessagePreview;
@override final  String? lastMessageSenderId;
@override final  MessageType? lastMessageType;
@override final  DateTime? lastMessageAt;
@override@JsonKey() final  int unreadCount;
// Settings & Permissions
@override@JsonKey() final  bool isArchived;
@override@JsonKey() final  bool isMuted;
// Metadata
@override final  String createdBy;
@override final  DateTime createdAt;
@override final  DateTime? updatedAt;
// For direct chats
@override final  String? otherUserId;

/// Create a copy of ChatRoomModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChatRoomModelCopyWith<_ChatRoomModel> get copyWith => __$ChatRoomModelCopyWithImpl<_ChatRoomModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ChatRoomModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChatRoomModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.type, type) || other.type == type)&&const DeepCollectionEquality().equals(other._memberIds, _memberIds)&&const DeepCollectionEquality().equals(other._memberNames, _memberNames)&&const DeepCollectionEquality().equals(other._memberAvatars, _memberAvatars)&&const DeepCollectionEquality().equals(other._adminIds, _adminIds)&&(identical(other.lastMessageId, lastMessageId) || other.lastMessageId == lastMessageId)&&(identical(other.lastMessagePreview, lastMessagePreview) || other.lastMessagePreview == lastMessagePreview)&&(identical(other.lastMessageSenderId, lastMessageSenderId) || other.lastMessageSenderId == lastMessageSenderId)&&(identical(other.lastMessageType, lastMessageType) || other.lastMessageType == lastMessageType)&&(identical(other.lastMessageAt, lastMessageAt) || other.lastMessageAt == lastMessageAt)&&(identical(other.unreadCount, unreadCount) || other.unreadCount == unreadCount)&&(identical(other.isArchived, isArchived) || other.isArchived == isArchived)&&(identical(other.isMuted, isMuted) || other.isMuted == isMuted)&&(identical(other.createdBy, createdBy) || other.createdBy == createdBy)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.otherUserId, otherUserId) || other.otherUserId == otherUserId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,name,description,imageUrl,type,const DeepCollectionEquality().hash(_memberIds),const DeepCollectionEquality().hash(_memberNames),const DeepCollectionEquality().hash(_memberAvatars),const DeepCollectionEquality().hash(_adminIds),lastMessageId,lastMessagePreview,lastMessageSenderId,lastMessageType,lastMessageAt,unreadCount,isArchived,isMuted,createdBy,createdAt,updatedAt,otherUserId]);

@override
String toString() {
  return 'ChatRoomModel(id: $id, name: $name, description: $description, imageUrl: $imageUrl, type: $type, memberIds: $memberIds, memberNames: $memberNames, memberAvatars: $memberAvatars, adminIds: $adminIds, lastMessageId: $lastMessageId, lastMessagePreview: $lastMessagePreview, lastMessageSenderId: $lastMessageSenderId, lastMessageType: $lastMessageType, lastMessageAt: $lastMessageAt, unreadCount: $unreadCount, isArchived: $isArchived, isMuted: $isMuted, createdBy: $createdBy, createdAt: $createdAt, updatedAt: $updatedAt, otherUserId: $otherUserId)';
}


}

/// @nodoc
abstract mixin class _$ChatRoomModelCopyWith<$Res> implements $ChatRoomModelCopyWith<$Res> {
  factory _$ChatRoomModelCopyWith(_ChatRoomModel value, $Res Function(_ChatRoomModel) _then) = __$ChatRoomModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String? description, String? imageUrl, ChatRoomType type, List<String> memberIds, Map<String, String> memberNames, Map<String, String> memberAvatars, List<String>? adminIds, String? lastMessageId, String? lastMessagePreview, String? lastMessageSenderId, MessageType? lastMessageType, DateTime? lastMessageAt, int unreadCount, bool isArchived, bool isMuted, String createdBy, DateTime createdAt, DateTime? updatedAt, String? otherUserId
});




}
/// @nodoc
class __$ChatRoomModelCopyWithImpl<$Res>
    implements _$ChatRoomModelCopyWith<$Res> {
  __$ChatRoomModelCopyWithImpl(this._self, this._then);

  final _ChatRoomModel _self;
  final $Res Function(_ChatRoomModel) _then;

/// Create a copy of ChatRoomModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? description = freezed,Object? imageUrl = freezed,Object? type = null,Object? memberIds = null,Object? memberNames = null,Object? memberAvatars = null,Object? adminIds = freezed,Object? lastMessageId = freezed,Object? lastMessagePreview = freezed,Object? lastMessageSenderId = freezed,Object? lastMessageType = freezed,Object? lastMessageAt = freezed,Object? unreadCount = null,Object? isArchived = null,Object? isMuted = null,Object? createdBy = null,Object? createdAt = null,Object? updatedAt = freezed,Object? otherUserId = freezed,}) {
  return _then(_ChatRoomModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as ChatRoomType,memberIds: null == memberIds ? _self._memberIds : memberIds // ignore: cast_nullable_to_non_nullable
as List<String>,memberNames: null == memberNames ? _self._memberNames : memberNames // ignore: cast_nullable_to_non_nullable
as Map<String, String>,memberAvatars: null == memberAvatars ? _self._memberAvatars : memberAvatars // ignore: cast_nullable_to_non_nullable
as Map<String, String>,adminIds: freezed == adminIds ? _self._adminIds : adminIds // ignore: cast_nullable_to_non_nullable
as List<String>?,lastMessageId: freezed == lastMessageId ? _self.lastMessageId : lastMessageId // ignore: cast_nullable_to_non_nullable
as String?,lastMessagePreview: freezed == lastMessagePreview ? _self.lastMessagePreview : lastMessagePreview // ignore: cast_nullable_to_non_nullable
as String?,lastMessageSenderId: freezed == lastMessageSenderId ? _self.lastMessageSenderId : lastMessageSenderId // ignore: cast_nullable_to_non_nullable
as String?,lastMessageType: freezed == lastMessageType ? _self.lastMessageType : lastMessageType // ignore: cast_nullable_to_non_nullable
as MessageType?,lastMessageAt: freezed == lastMessageAt ? _self.lastMessageAt : lastMessageAt // ignore: cast_nullable_to_non_nullable
as DateTime?,unreadCount: null == unreadCount ? _self.unreadCount : unreadCount // ignore: cast_nullable_to_non_nullable
as int,isArchived: null == isArchived ? _self.isArchived : isArchived // ignore: cast_nullable_to_non_nullable
as bool,isMuted: null == isMuted ? _self.isMuted : isMuted // ignore: cast_nullable_to_non_nullable
as bool,createdBy: null == createdBy ? _self.createdBy : createdBy // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,otherUserId: freezed == otherUserId ? _self.otherUserId : otherUserId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
