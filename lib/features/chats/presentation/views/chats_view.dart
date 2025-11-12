import 'package:flutter/material.dart';

import '../widgets/chats_widgets/chats_app_bar.dart';
import '../widgets/chats_widgets/chats_archived_button.dart';
import '../widgets/chats_widgets/chats_filter_chips_list.dart';
import '../widgets/chats_widgets/chats_list.dart';

class ChatsView extends StatelessWidget {
  const ChatsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        ChatsAppBar(),
        SliverPadding(padding: EdgeInsets.only(top: 8.0)),
        ChatsFilterChipsList(),
        SliverPadding(padding: EdgeInsets.only(top: 5.0)),
        ChatsArchivedButton(),
        SliverPadding(padding: EdgeInsets.only(top: 5.0)),
        ChatsList(),
      ],
    );
  }
}
