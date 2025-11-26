import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/utils/enums/message_status.dart';
import '../../../../core/utils/enums/message_type.dart';

part 'message_model.freezed.dart';
part 'message_model.g.dart';

@freezed
sealed class MessageModel with _$MessageModel {
  const factory MessageModel({
    required String id,
    required String chatId,
    required String senderId,
    String? senderName,

    String? replyToId,
    required String content,
    @Default(MessageType.text) MessageType type,

    Map<String, dynamic>? metadata,
    @Default([]) List<String> readBy,

    @Default(MessageStatus.sending) MessageStatus status,
    @Default(false) bool isEdited,
    @Default(false) bool isDeleted,

    required DateTime createdAt,
    DateTime? updatedAt,
  }) = _MessageModel;

  factory MessageModel.fromJson(Map<String, dynamic> json) =>
      _$MessageModelFromJson(json);
}
