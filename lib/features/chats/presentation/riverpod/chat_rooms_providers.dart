import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/data_source/chats_remote_data_source.dart';
import '../../data/repo_impl/chat_rooms_repo_impl.dart';
import '../../domain/entity/chat_room_entity.dart';
import '../../domain/repo/chat_rooms_repo.dart';
import 'chat_rooms_notifier.dart';

// Data source provider
final chatsRemoteDataSourceProvider = Provider((ref) {
  return ChatsRemoteDataSource();
});

// Repo provider
final chatRoomsRepoProvider = Provider<ChatRoomsRepo>((ref) {
  final ds = ref.watch(chatsRemoteDataSourceProvider);
  return ChatRoomsRepoImpl(remoteDataSource: ds);
});

// Notifier provider
final chatRoomsNotifierProvider =
    AsyncNotifierProvider.autoDispose<ChatRoomsNotifier, List<ChatRoomEntity>?>(
      () => ChatRoomsNotifier(),
    );
