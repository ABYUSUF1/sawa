import '../../../../core/utils/enums/message_status.dart';
import '../../../../core/utils/enums/message_type.dart';

class MessageEntity {
  final String id;
  final String chatId;
  final String senderId;
  final String? senderName;
  final String? replyToId;

  final String content;
  final MessageType type;
  final MessageStatus status;

  final Map<String, dynamic>? metadata;
  final List<String> readBy;

  final bool isEdited;
  final bool isDeleted;

  final DateTime createdAt;
  final DateTime? updatedAt;

  const MessageEntity({
    required this.id,
    required this.chatId,
    required this.senderId,
    this.senderName,
    this.replyToId,
    required this.content,
    this.type = MessageType.text,
    this.metadata,
    this.readBy = const [],
    this.status = MessageStatus.sending,
    this.isEdited = false,
    this.isDeleted = false,
    required this.createdAt,
    this.updatedAt,
  });
}
