import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

class ConversationAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const ConversationAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AppBar(
      backgroundColor: theme.colorScheme.surfaceContainerHigh,
      leadingWidth: 28,
      title: ListTile(
        contentPadding: const EdgeInsets.all(0),
        leading: const CircleAvatar(
          child: Text('U1', style: TextStyle(color: Colors.white)),
        ),
        title: Text(
          "Mahmoud Glal",
          style: TextStyle(fontWeight: FontWeight.w600),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Text(
          "9:35 PM",
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
