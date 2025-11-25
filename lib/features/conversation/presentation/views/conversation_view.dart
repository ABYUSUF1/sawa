import 'package:flutter/material.dart';
import 'package:sawa/features/conversation/presentation/widgets/conversation_text_field.dart';

import '../widgets/conversation_app_bar.dart';

class ConversationView extends StatelessWidget {
  const ConversationView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: ConversationAppBar(),
      bottomNavigationBar: ConversationTextField(),
      body: Center(child: Text("Messages List")),
    );
  }
}
