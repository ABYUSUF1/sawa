import '../../../../core/utils/enums/message_status.dart';
import '../../../../core/utils/enums/message_type.dart';

class MessageModel {
  final String id;
  final String chatId;
  final String senderId;
  final String? senderName; // Optional: for displaying sender's name
  final String? replyToId;

  // Support for different types, not just text
  final String content;
  final MessageType type;
  final MessageStatus status;

  // Metadata for things like file_size, image_width, or audio_duration
  final Map<String, dynamic>? metadata;

  // List of user IDs who have read the message
  final List<String> readBy;

  final bool isEdited;
  final bool isDeleted;
  final DateTime createdAt;
  final DateTime? updatedAt;

  MessageModel({
    required this.id,
    required this.chatId,
    required this.senderId,
    this.senderName,
    required this.content,
    this.type = MessageType.text,
    this.metadata,
    this.replyToId,
    this.readBy = const [], // Default to empty
    this.status = MessageStatus.sending,
    this.isEdited = false,
    this.isDeleted = false,
    required this.createdAt,
    this.updatedAt,
  });
}
