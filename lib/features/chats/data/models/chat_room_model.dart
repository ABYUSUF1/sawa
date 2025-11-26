import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/utils/enums/chat_room_type.dart';
import '../../../../core/utils/enums/message_type.dart';
import '../../domain/entity/chat_room_entity.dart';

part 'chat_room_model.freezed.dart';
part 'chat_room_model.g.dart';

@freezed
sealed class ChatRoomModel with _$ChatRoomModel {
  const factory ChatRoomModel({
    required String id,
    required String name,
    String? description,
    String? imageUrl,
    required ChatRoomType type,

    // members
    required List<String> memberIds,
    @Default({}) Map<String, String> memberNames,
    @Default({}) Map<String, String> memberAvatars,
    List<String>? adminIds,

    // Last message info
    String? lastMessageId,
    String? lastMessagePreview,
    String? lastMessageSenderId,
    MessageType? lastMessageType,
    DateTime? lastMessageAt,
    @Default(0) int unreadCount,

    // Settings & Permissions
    @Default(false) bool isArchived,
    @Default(false) bool isMuted,

    // Metadata
    required String createdBy,
    required DateTime createdAt,
    DateTime? updatedAt,

    // For direct chats
    String? otherUserId,
  }) = _ChatRoomModel;

  factory ChatRoomModel.fromJson(Map<String, dynamic> json) =>
      _$ChatRoomModelFromJson(json);
}

extension ChatRoomModelX on ChatRoomModel {
  // Convert to Entity
  ChatRoomEntity toEntity() {
    return ChatRoomEntity(
      id: id,
      name: name,
      description: description,
      imageUrl: imageUrl,
      type: type,
      memberIds: memberIds,
      memberNames: memberNames,
      memberAvatars: memberAvatars,
      adminIds: adminIds,
      lastMessageId: lastMessageId,
      lastMessagePreview: lastMessagePreview,
      lastMessageSenderId: lastMessageSenderId,
      lastMessageType: lastMessageType,
      lastMessageAt: lastMessageAt,
      unreadCount: unreadCount,
      isArchived: isArchived,
      isMuted: isMuted,
      createdBy: createdBy,
      createdAt: createdAt,
      updatedAt: updatedAt,
      otherUserId: otherUserId,
    );
  }
}
