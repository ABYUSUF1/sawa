import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../riverpod/notifiers/contacts_state.dart';
import 'contact_list_empty.dart';
import 'contact_list_item.dart';
import 'contact_section_header.dart';
import 'contacts_top_options_section.dart';
import '../../riverpod/contacts_providers.dart';

class ContactList extends ConsumerWidget {
  /// If [selectable] is true, list items are selectable (taps will select).
  /// If [navigateOnTap] is true, tapping an app user navigates to conversation.
  final bool selectable;
  final bool navigateOnTap;

  const ContactList({
    super.key,
    this.selectable = false,
    this.navigateOnTap = true,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(contactsNotifierProvider);

    if (state is! ContactsSuccess) {
      return const SliverToBoxAdapter(child: SizedBox());
    }

    final appUsers = state.searchQuery.isNotEmpty
        ? state.filteredAppUsers
        : state.appUserContacts.where((c) => c.isAppUser).toList();

    final nonAppUsers = state.searchQuery.isNotEmpty
        ? state.filteredNonAppUsers
        : state.appUserContacts.where((c) => !c.isAppUser).toList();

    if (state.searchQuery.isNotEmpty &&
        appUsers.isEmpty &&
        nonAppUsers.isEmpty) {
      return const ContactListEmpty();
    }

    final items = <Widget>[];

    if (appUsers.isNotEmpty) {
      if (!selectable) {
        // Only show top options if this list is *not* selectable (normal ContactsView)
        items.add(const ContactsTopOptionsSection());
      }
      items.add(const ContactsSectionHeader(title: 'Contacts on Sawa'));
      items.addAll(
        appUsers.map(
          (c) => ContactListItem(
            contact: c,
            selectable: selectable,
            navigateOnTap: navigateOnTap,
          ),
        ),
      );
    }

    if (nonAppUsers.isNotEmpty) {
      items.add(const ContactsSectionHeader(title: 'Invite to Sawa'));
      items.addAll(
        nonAppUsers.map(
          (c) => ContactListItem(
            contact: c,
            selectable: selectable,
            navigateOnTap: navigateOnTap,
          ),
        ),
      );
    }

    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) => items[index],
        childCount: items.length,
      ),
    );
  }
}
