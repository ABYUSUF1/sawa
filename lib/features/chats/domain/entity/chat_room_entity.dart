import '../../../../core/utils/enums/chat_room_type.dart';
import '../../../../core/utils/enums/message_type.dart';
import '../../../auth/domain/entity/user_entity.dart';
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

  // Copy with
  ChatRoomEntity copyWith({
    String? id,
    String? name,
    String? description,
    String? imageUrl,
    ChatRoomType? type,
    List<String>? memberIds,
    Map<String, String>? memberNames,
    Map<String, String>? memberAvatars,
    List<String>? adminIds,
    String? lastMessageId,
    String? lastMessagePreview,
    String? lastMessageSenderId,
    MessageType? lastMessageType,
    DateTime? lastMessageAt,
    int? unreadCount,
    bool? isArchived,
    bool? isMuted,
    String? createdBy,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? otherUserId,
  }) {
    return ChatRoomEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      imageUrl: imageUrl ?? this.imageUrl,
      type: type ?? this.type,
      memberIds: memberIds ?? this.memberIds,
      memberNames: memberNames ?? this.memberNames,
      memberAvatars: memberAvatars ?? this.memberAvatars,
      adminIds: adminIds ?? this.adminIds,
      lastMessageId: lastMessageId ?? this.lastMessageId,
      lastMessagePreview: lastMessagePreview ?? this.lastMessagePreview,
      lastMessageSenderId: lastMessageSenderId ?? this.lastMessageSenderId,
      lastMessageType: lastMessageType ?? this.lastMessageType,
      lastMessageAt: lastMessageAt ?? this.lastMessageAt,
      unreadCount: unreadCount ?? this.unreadCount,
      isArchived: isArchived ?? this.isArchived,
      isMuted: isMuted ?? this.isMuted,
      createdBy: createdBy ?? this.createdBy,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      otherUserId: otherUserId ?? this.otherUserId,
    );
  }

  static ChatRoomEntity newChatRoomEntity({
    required UserEntity currentUser,
    required UserEntity otherUser,
  }) {
    return ChatRoomEntity(
      id: '',
      name: otherUser.fullName,
      description: otherUser.bio,
      imageUrl: otherUser.profileImage,
      type: ChatRoomType.direct,

      memberIds: [currentUser.id, otherUser.id],
      memberNames: {
        currentUser.id: currentUser.fullName,
        otherUser.id: otherUser.fullName,
      },
      memberAvatars: {
        currentUser.id: currentUser.profileImage ?? '',
        otherUser.id: otherUser.profileImage ?? '',
      },

      adminIds: null, // 1-to-1 has no admins
      lastMessageId: null,
      lastMessagePreview: null,
      lastMessageSenderId: null,
      lastMessageType: null,
      lastMessageAt: null,
      unreadCount: 0,
      isArchived: false,
      isMuted: false,
      createdBy: currentUser.id,
      createdAt: DateTime.now(),
      updatedAt: null,

      otherUserId: otherUser.id,
    );
  }
}
