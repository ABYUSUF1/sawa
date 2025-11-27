import 'package:flutter/material.dart';
import 'package:sawa/features/conversation/presentation/widgets/message_bubble.dart';

import '../../../../core/utils/enums/message_status.dart';
import '../../../../core/utils/enums/message_type.dart';
import '../../domain/entity/message_entity.dart';

class ConversationViewBody extends StatelessWidget {
  const ConversationViewBody({super.key});

  List<MessageEntity> _buildSampleMessages() {
    // new -> older (index 0 is newest). You can replace this with your real message list.
    return List.generate(20, (index) {
      return MessageEntity(
        id: '$index',
        chatId: 'chat_id',
        senderId: index % 5 == 0 ? 'current_user_id' : 'other_user_id',
        content: 'Message number $index',
        type: MessageType.text,
        status: MessageStatus.read,
        createdAt: DateTime.now().subtract(Duration(minutes: index * 5)),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final messages = _buildSampleMessages(); // replace with your repo list
    final width = MediaQuery.of(context).size.width;

    return Expanded(
      child: Align(
        alignment: Alignment.topCenter,
        child: ListView.builder(
          padding: const EdgeInsets.only(bottom: 12),
          reverse: true,
          itemCount: messages.length,
          itemBuilder: (BuildContext context, int index) {
            // Because we generate messages newest -> older and use reverse: true,
            // the "next" message in chronological order (older) is at index + 1.
            final message = messages[index];
            final nextMessage = (index + 1) < messages.length
                ? messages[index + 1]
                : null;

            final isMe = message.senderId == 'current_user_id';
            final sameSenderAsNext =
                nextMessage != null && nextMessage.senderId == message.senderId;

            // small gap when same sender, bigger gap when sender changed
            final verticalGap = sameSenderAsNext ? 5.0 : 14.0;

            return Padding(
              padding: EdgeInsets.only(left: 8.0, right: 8.0, top: verticalGap),
              child: MessageBubble(
                message: message,
                isMe: isMe,
                maxWidth: width * 0.75,
              ),
            );
          },
        ),
      ),
    );
  }
}
