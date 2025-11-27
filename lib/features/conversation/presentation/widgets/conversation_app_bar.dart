import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

import '../args/conversation_args.dart';

class ConversationAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const ConversationAppBar({super.key, required this.conversationArgs});

  final ConversationArgs conversationArgs;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AppBar(
      backgroundColor: theme.colorScheme.surfaceContainerHigh,
      leadingWidth: 28,
      title: ListTile(
        contentPadding: const EdgeInsets.all(0),
        leading: CircleAvatar(child: Text(conversationArgs.room.name[0])),
        title: Text(
          conversationArgs.room.name,
          style: const TextStyle(fontWeight: FontWeight.w600),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Text(
          conversationArgs.otherUser?.lastSeenAt?.toString() ?? '',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(color: theme.colorScheme.onSurface),
        ),
      ),
      actions: [
        IconButton(onPressed: () {}, icon: const Icon(IconsaxPlusLinear.video)),
        IconButton(onPressed: () {}, icon: const Icon(IconsaxPlusLinear.call)),
        PopupMenuButton(itemBuilder: (_) => []),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
