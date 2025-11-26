import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/utils/functions/get_friendly_failure.dart';
import '../../domain/entity/chat_room_entity.dart';
import 'chat_rooms_providers.dart';

class ChatRoomsNotifier extends AsyncNotifier<List<ChatRoomEntity>?> {
  @override
  FutureOr<List<ChatRoomEntity>?> build() {
    final repo = ref.read(chatRoomsRepoProvider);
    repo.streamChatRooms().listen(
      (rooms) {
        state = AsyncData(rooms);
      },
      onError: (error, stack) {
        final failure = getFriendlyFailure(error);
        state = AsyncError(failure.errMessage, stack);
      },
    );

    // return null → means “still loading”
    return null;
  }
}
