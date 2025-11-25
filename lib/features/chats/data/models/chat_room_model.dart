import '../../../../core/utils/enums/chat_room_type.dart';
import '../../../../core/utils/enums/message_type.dart';

class ChatRoomModel {
  final String id;
  final String name;
  final String? description;
  final String? imageUrl;
  final ChatRoomType type;

  // members
  final List<String> memberIds;
  final Map<String, String> memberNames;
  final Map<String, String> memberAvatars; // userId -> avatarUrl
  final List<String>? adminIds; // For group chats

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

  ChatRoomModel({
    required this.id,
    required this.name,
    this.description,
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
    this.imageUrl,
    this.isArchived = false,
    this.isMuted = false,
    required this.createdBy,
    required this.createdAt,
    this.updatedAt,
    this.otherUserId,
  });
}
