import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sawa/core/widgets/text_field_widgets/custom_search_field.dart';
import 'package:sawa/generated/locale_keys.g.dart';

class ChatsSearchBar extends StatelessWidget implements PreferredSizeWidget {
  const ChatsSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12.0, 0, 12.0, 12.0),
      child: CustomSearchField(
        hintText: context.tr(LocaleKeys.common_search_chats),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(72.0);
}
