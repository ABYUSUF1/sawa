import '../../../../core/utils/enums/chat_room_type.dart';
import '../../../../core/utils/enums/message_type.dart';
import '../../data/models/chat_room_model.dart';

class ChatRoomEntity {
  final String id;
  final String name;
  final String? description;
  final String? imageUrl;
  final ChatRoomType type;

  // members
  final List<String> memberIds;
  final Map<String, String> memberNames;
  final Map<String, String> memberAvatars;
  final List<String>? adminIds;

  // Last message info
  final String? lastMessageId;
  final String? lastMessagePreview;
  final String? lastMessageSenderId;
  final MessageType? lastMessageType;
  final DateTime? lastMessageAt;
  final int unreadCount;

  // Settings & Permissions
  final bool isArchived;
  final bool isMuted;

  // Metadata
  final String createdBy;
  final DateTime createdAt;
  final DateTime? updatedAt;

  // For direct chats
  final String? otherUserId;

  const ChatRoomEntity({
    required this.id,
    required this.name,
    this.description,
    this.imageUrl,
    required this.type,
    required this.memberIds,
    this.memberNames = const {},
    this.memberAvatars = const {},
    this.adminIds,
    this.lastMessageId,
    this.lastMessagePreview,
    this.lastMessageSenderId,
    this.lastMessageType,
    this.lastMessageAt,
    this.unreadCount = 0,
    this.isArchived = false,
    this.isMuted = false,
    required this.createdBy,
    required this.createdAt,
    this.updatedAt,
    this.otherUserId,
  });

  // Convert to Model
  ChatRoomModel toModel() {
    return ChatRoomModel(
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
