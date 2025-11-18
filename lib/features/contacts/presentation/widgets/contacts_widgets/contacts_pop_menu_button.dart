import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../riverpod/contacts_providers.dart';

class ContactsPopMenuButton extends StatelessWidget {
  final WidgetRef ref;
  const ContactsPopMenuButton({super.key, required this.ref});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      itemBuilder: (context) => [
        const PopupMenuItem(value: 'refresh', child: Text('Refresh contacts')),
      ],
      onSelected: (value) {
        if (value == 'refresh') {
          ref
              .read(contactsNotifierProvider.notifier)
              .fetchContacts(isRefresh: true);
        }
      },
    );
  }
}
