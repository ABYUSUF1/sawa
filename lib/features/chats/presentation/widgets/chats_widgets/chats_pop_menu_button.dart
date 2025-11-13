import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:sawa/core/router/app_route_name.dart';

import '../../../../../generated/locale_keys.g.dart'; // optional if you use custom icons

class ChatsPopMenuButton extends StatelessWidget {
  const ChatsPopMenuButton({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      itemBuilder: (_) => [
        PopupMenuItem(
          value: 'New Group',
          child: Row(
            children: [
              const Icon(
                Icons.group_add_outlined,
                size: 20,
              ), // or Icons.group_add
              const SizedBox(width: 8),
              Text(context.tr(LocaleKeys.chat_new_group)),
            ],
          ),
        ),
        PopupMenuItem(
          value: 'Read All',
          child: Row(
            children: [
              const Icon(Icons.done_all, size: 20), // or Icons.mark_chat_read
              const SizedBox(width: 8),
              Text(context.tr(LocaleKeys.chat_read_all)),
            ],
          ),
        ),
        PopupMenuItem(
          value: 'Settings',
          onTap: () {
            context.pushNamed(AppRouteNames.settings);
          },
          child: Row(
            children: [
              const Icon(
                IconsaxPlusLinear.setting_2,
                size: 20,
              ), // or Icons.settings
              const SizedBox(width: 8),
              Text(context.tr(LocaleKeys.chat_settings)),
            ],
          ),
        ),
      ],
    );
  }
}
