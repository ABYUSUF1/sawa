import 'package:flutter/material.dart';
import 'package:sawa/features/conversation/presentation/widgets/conversation_text_field.dart';
import 'package:sawa/features/conversation/presentation/widgets/conversation_view_body.dart';

import '../args/conversation_args.dart';
import '../widgets/conversation_app_bar.dart';

class ConversationView extends StatelessWidget {
  final ConversationArgs conversationArgs;
  const ConversationView({super.key, required this.conversationArgs});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ConversationAppBar(conversationArgs: conversationArgs),
      body: SafeArea(
        child: const Column(
          children: [ConversationViewBody(), ConversationTextField()],
        ),
      ),
    );
  }
}
