import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'contacts_pop_menu_button.dart';
import 'contacts_search_bar.dart';

class ContactsAppBar extends StatelessWidget {
  final WidgetRef ref;
  const ContactsAppBar({super.key, required this.ref});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SliverAppBar(
      backgroundColor: theme.scaffoldBackgroundColor,
      surfaceTintColor: theme.scaffoldBackgroundColor,
      title: const Text('Contacts'),
      pinned: true,
      actions: [ContactsPopMenuButton(ref: ref)],
      bottom: ContactsSearchBar(ref: ref),
    );
  }
}
