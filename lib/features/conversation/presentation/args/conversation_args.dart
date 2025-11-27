// conversation_args.dart
import '../../../auth/domain/entity/user_entity.dart';
import '../../../chats/domain/entity/chat_room_entity.dart';

class ConversationArgs {
  final ChatRoomEntity room;
  final UserEntity? otherUser;
  final List<UserEntity>? members;
  final bool isExistingRoom;

  const ConversationArgs._({
    required this.room,
    this.otherUser,
    this.members,
    required this.isExistingRoom,
  });

  /// For 1-to-1 chat
  factory ConversationArgs.direct({
    required ChatRoomEntity room,
    required UserEntity otherUser,
    required bool isExistingRoom,
  }) {
    return ConversationArgs._(
      room: room,
      otherUser: otherUser,
      members: null,
      isExistingRoom: isExistingRoom,
    );
  }

  /// For groups
  factory ConversationArgs.group({
    required ChatRoomEntity room,
    required List<UserEntity> members,
    required bool isExistingRoom,
  }) {
    return ConversationArgs._(
      room: room,
      members: members,
      otherUser: null,
      isExistingRoom: isExistingRoom,
    );
  }
}
