import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

import '../../../../../generated/locale_keys.g.dart';

class ChatsArchivedButton extends StatelessWidget {
  const ChatsArchivedButton({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SliverToBoxAdapter(
      child: ListTile(
        leading: const Icon(IconsaxPlusLinear.archive),
        title: Text(context.tr(LocaleKeys.chat_archived)),
        trailing: Text(
          '3', // Example unread count
          style: TextStyle(
            color: theme.colorScheme.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
        onTap: () {
          // TODO: Navigate to Archived Chats View
        },
      ),
    );
  }
}
