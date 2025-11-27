import 'package:sawa/features/chats/data/models/chat_room_model.dart';
import 'package:sawa/features/chats/domain/entity/chat_room_entity.dart';

import '../../domain/repo/chat_rooms_repo.dart';
import '../data_source/chats_remote_data_source.dart';

class ChatRoomsRepoImpl implements ChatRoomsRepo {
  ChatRoomsRepoImpl({required this.remoteDataSource});

  final ChatsRemoteDataSource remoteDataSource;

  @override
  Future<void> createChatRoom(ChatRoomEntity chatRoom) async {
    await remoteDataSource.createChatRoom(chatRoom.toModel());
  }

  @override
  Stream<List<ChatRoomEntity>?> streamChatRooms() {
    return remoteDataSource.streamChatRooms().map(
      (chatRoomModels) =>
          chatRoomModels?.map((model) => model.toEntity()).toList(),
    );
  }

  @override
  Future<ChatRoomEntity?> getDirectChatRoom({
    required String otherUserId,
  }) async {
    return await remoteDataSource
        .getDirectChatRoom(otherUserId: otherUserId)
        .then((model) => model?.toEntity());
  }
}
