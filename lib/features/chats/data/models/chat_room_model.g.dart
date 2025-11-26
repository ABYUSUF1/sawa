// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_room_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ChatRoomModel _$ChatRoomModelFromJson(Map<String, dynamic> json) =>
    _ChatRoomModel(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String?,
      imageUrl: json['image_url'] as String?,
      type: $enumDecode(_$ChatRoomTypeEnumMap, json['type']),
      memberIds: (json['member_ids'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      memberNames:
          (json['member_names'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(k, e as String),
          ) ??
          const {},
      memberAvatars:
          (json['member_avatars'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(k, e as String),
          ) ??
          const {},
      adminIds: (json['admin_ids'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      lastMessageId: json['last_message_id'] as String?,
      lastMessagePreview: json['last_message_preview'] as String?,
      lastMessageSenderId: json['last_message_sender_id'] as String?,
      lastMessageType: $enumDecodeNullable(
        _$MessageTypeEnumMap,
        json['last_message_type'],
      ),
      lastMessageAt: json['last_message_at'] == null
          ? null
          : DateTime.parse(json['last_message_at'] as String),
      unreadCount: (json['unread_count'] as num?)?.toInt() ?? 0,
      isArchived: json['is_archived'] as bool? ?? false,
      isMuted: json['is_muted'] as bool? ?? false,
      createdBy: json['created_by'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      otherUserId: json['other_user_id'] as String?,
    );

Map<String, dynamic> _$ChatRoomModelToJson(_ChatRoomModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'image_url': instance.imageUrl,
      'type': _$ChatRoomTypeEnumMap[instance.type]!,
      'member_ids': instance.memberIds,
      'member_names': instance.memberNames,
      'member_avatars': instance.memberAvatars,
      'admin_ids': instance.adminIds,
      'last_message_id': instance.lastMessageId,
      'last_message_preview': instance.lastMessagePreview,
      'last_message_sender_id': instance.lastMessageSenderId,
      'last_message_type': _$MessageTypeEnumMap[instance.lastMessageType],
      'last_message_at': instance.lastMessageAt?.toIso8601String(),
      'unread_count': instance.unreadCount,
      'is_archived': instance.isArchived,
      'is_muted': instance.isMuted,
      'created_by': instance.createdBy,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'other_user_id': instance.otherUserId,
    };

const _$ChatRoomTypeEnumMap = {
  ChatRoomType.oneToOne: 'oneToOne',
  ChatRoomType.group: 'group',
};

const _$MessageTypeEnumMap = {
  MessageType.text: 'text',
  MessageType.image: 'image',
  MessageType.audio: 'audio',
  MessageType.video: 'video',
  MessageType.file: 'file',
  MessageType.system: 'system',
};
