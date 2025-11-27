import 'package:sawa/features/chats/domain/entity/chat_room_entity.dart';

abstract class ChatRoomsRepo {
  Future<void> createChatRoom(ChatRoomEntity chatRoom);
  Stream<List<ChatRoomEntity>?> streamChatRooms();
  Future<ChatRoomEntity?> getDirectChatRoom({required String otherUserId});
}
