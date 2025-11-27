import 'package:sawa/core/constants/supabase_tables.dart';
import 'package:sawa/features/chats/data/models/chat_room_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ChatsRemoteDataSource {
  final supabase = Supabase.instance.client;

  Future<void> createChatRoom(ChatRoomModel chatRoom) async {
    await supabase.from(SupabaseTables.chatRooms).insert(chatRoom.toJson());
  }

  /// Streams all chat rooms for the current user.
  ///
  /// The filtering is done entirely on the server using Row-Level Security (RLS):
  /// - Only returns rooms where the current user is included in `member_ids`.
  /// - Works for both 1-to-1 and group chats.
  /// - Includes last message info and other metadata stored in the `chat_rooms` table.
  /// No client-side filtering is needed — the server ensures security and proper access.
  Stream<List<ChatRoomModel>?> streamChatRooms() {
    return supabase
        .from(SupabaseTables.chatRooms)
        .stream(primaryKey: ['id'])
        .limit(50)
        .map((maps) => maps.map((map) => ChatRoomModel.fromJson(map)).toList());
  }

  Future<ChatRoomModel?> getDirectChatRoom({
    required String otherUserId,
  }) async {
    final currentUserId = supabase.auth.currentUser?.id;
    final response = await supabase
        .from('chat_rooms')
        .select()
        .eq('type', 'direct')
        .contains('member_ids', [currentUserId, otherUserId])
        .limit(1)
        .maybeSingle();

    return response != null ? ChatRoomModel.fromJson(response) : null;
  }
}
