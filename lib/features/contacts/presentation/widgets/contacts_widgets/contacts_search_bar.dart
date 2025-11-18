import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sawa/core/widgets/text_field_widgets/custom_search_field.dart';
import 'package:sawa/generated/locale_keys.g.dart';

import '../../riverpod/contacts_providers.dart';

class ContactsSearchBar extends StatefulWidget implements PreferredSizeWidget {
  final WidgetRef ref;
  const ContactsSearchBar({super.key, required this.ref});

  @override
  State<ContactsSearchBar> createState() => _ContactsSearchBarState();

  @override
  Size get preferredSize => const Size.fromHeight(72.0);
}

class _ContactsSearchBarState extends State<ContactsSearchBar> {
  final controller = TextEditingController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final notifier = widget.ref.read(contactsNotifierProvider.notifier);
    return Padding(
      padding: const EdgeInsets.fromLTRB(12.0, 0, 12.0, 12.0),
      child: CustomSearchField(
        controller: controller,
        hintText: context.tr(LocaleKeys.common_search_name_or_phone),
        onChanged: (p0) => notifier.searchContacts(p0),
        onClear: () {
          controller.clear();
          notifier.clearSearch();
        },
      ),
    );
  }
}
