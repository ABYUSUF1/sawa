import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/entities/contact_entity.dart';
import '../../riverpod/contacts_providers.dart';

class ContactListItem extends StatelessWidget {
  final WidgetRef ref;
  final ContactEntity contact;

  const ContactListItem({super.key, required this.contact, required this.ref});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.grey[300],
        child: Text(
          contact.contactName.isNotEmpty
              ? contact.contactName[0].toUpperCase()
              : '?',
          style: const TextStyle(color: Colors.black),
        ),
      ),
      title: Text(
        contact.contactName,
        style: const TextStyle(fontWeight: FontWeight.w500),
      ),
      subtitle: contact.isAppUser
          ? (contact.user == null || contact.user!.isBioEmpty
                ? null
                : Text(contact.user!.bio ?? ''))
          : Text(contact.phoneNumber),
      trailing: contact.isAppUser
          ? null
          : Text(
              "Invite",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: theme.colorScheme.primary,
              ),
            ),
      onTap: () async {
        final notifier = ref.read(contactsNotifierProvider.notifier);
        final updated = await notifier.onContactTap(contact);
        if (updated!.isAppUser) {
          // navigate to chat/profile using updated.user / updated fields
        } else {
          // show invite flow
        }
      },
    );
  }
}
