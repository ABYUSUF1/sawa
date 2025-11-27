// lib/features/conversation/presentation/providers/conversation_provider.dart

import 'package:flutter_riverpod/legacy.dart';
import '../../../../core/utils/enums/message_status.dart';
import '../../../../core/utils/enums/message_type.dart';
import '../../domain/entity/message_entity.dart';

// 1. The StateNotifier class
class ConversationController extends StateNotifier<List<MessageEntity>> {
  final String chatId;

  ConversationController(this.chatId) : super([]) {
    loadMessages();
  }

  // Simulate fetching data
  Future<void> loadMessages() async {
    // In a real app: await repository.getMessages(chatId);
    await Future.delayed(const Duration(seconds: 1)); // Mock delay

    state = [
      MessageEntity(
        id: '1',
        chatId: chatId,
        senderId: 'other_user_id',
        content: 'Hello! I saw your profile.',
        type: MessageType.text,
        status: MessageStatus.read,
        createdAt: DateTime.now().subtract(const Duration(minutes: 10)),
      ),
      MessageEntity(
        id: '2',
        chatId: chatId,
        senderId: 'current_user_id', // Needs to match your Auth ID
        content: 'Hi! Thanks for reaching out.',
        type: MessageType.text,
        status: MessageStatus.read,
        createdAt: DateTime.now().subtract(const Duration(minutes: 5)),
      ),
    ];
  }

  void sendMessage(String content, String currentUserId) {
    if (content.trim().isEmpty) return;

    final newMessage = MessageEntity(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      chatId: chatId,
      senderId: currentUserId,
      content: content,
      type: MessageType.text,
      status: MessageStatus.sending, // Initial status
      createdAt: DateTime.now(),
    );

    // Optimistic Update: Add to list immediately (at start because list is reversed)
    state = [newMessage, ...state];

    // Simulate Network Call
    Future.delayed(const Duration(seconds: 1), () {
      // Update status to 'sent'
      state = state.map((msg) {
        if (msg.id == newMessage.id) {
          // Use a copyWith method here ideally, but creating new for demo
          return MessageEntity(
            id: msg.id,
            chatId: msg.chatId,
            senderId: msg.senderId,
            content: msg.content,
            type: msg.type,
            status: MessageStatus.sent, // Updated Status
            createdAt: msg.createdAt,
          );
        }
        return msg;
      }).toList();
    });
  }
}

// 2. The Provider Definition
// We use .family because every chat room has its own unique list of messages
final conversationProvider =
    StateNotifierProvider.family<
      ConversationController,
      List<MessageEntity>,
      String
    >((ref, chatId) {
      return ConversationController(chatId);
    });
