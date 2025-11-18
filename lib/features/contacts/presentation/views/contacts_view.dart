import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sawa/features/contacts/presentation/riverpod/notifiers/contacts_state.dart';
import 'package:sawa/features/contacts/presentation/widgets/contacts_widgets/contact_list_empty.dart';
import '../../domain/entities/contact_entity.dart';
import '../riverpod/contacts_providers.dart';
import '../widgets/contacts_widgets/contact_list_item.dart';
import '../widgets/contacts_widgets/contact_section_header.dart';
import '../widgets/contacts_widgets/contacts_app_bar.dart';
import '../widgets/contacts_widgets/contacts_top_options_section.dart';

class ContactsView extends ConsumerWidget {
  const ContactsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final contactsState = ref.watch(contactsNotifierProvider);
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.colorScheme.surfaceContainerHigh,
      resizeToAvoidBottomInset: false,
      body: CustomScrollView(
        slivers: [
          ContactsAppBar(ref: ref),
          contactsState.when(
            loading: () => _buildLoadingSliver(),
            success:
                (
                  appUserContacts,
                  searchQuery,
                  filteredAppUsers,
                  filteredNonAppUsers,
                ) => _buildContactsSliver(
                  ref,
                  appUserContacts,
                  searchQuery,
                  filteredAppUsers,
                  filteredNonAppUsers,
                ),
            error: (message) => _buildErrorSliver(message),
          ),
        ],
      ),
    );
  }

  Widget _buildLoadingSliver() {
    return const SliverFillRemaining(
      child: Center(child: CircularProgressIndicator()),
    );
  }

  Widget _buildErrorSliver(String message) {
    return SliverFillRemaining(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Error: $message'),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Add refresh logic here
              },
              child: const Text('Retry'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContactsSliver(
    WidgetRef ref,
    List<ContactEntity> appUserContacts,
    String searchQuery,
    List<ContactEntity> filteredAppUsers,
    List<ContactEntity> filteredNonAppUsers,
  ) {
    final appUsers = searchQuery.isNotEmpty
        ? filteredAppUsers
        : appUserContacts.where((contact) => contact.isAppUser).toList();
    final nonAppUsers = searchQuery.isNotEmpty
        ? filteredNonAppUsers
        : appUserContacts.where((contact) => !contact.isAppUser).toList();

    if (searchQuery.isNotEmpty && appUsers.isEmpty && nonAppUsers.isEmpty) {
      return const ContactListEmpty();
    }

    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        // Calculate indices for sections
        final hasAppUsers = appUsers.isNotEmpty;
        final hasNonAppUsers = nonAppUsers.isNotEmpty;

        int currentIndex = 0;

        // App Users Section
        if (hasAppUsers) {
          if (index == currentIndex) {
            return const Column(
              children: [
                ContactsTopOptionsSection(),
                ContactsSectionHeader(title: 'Contacts on Sawa'),
              ],
            );
          }
          if (index > currentIndex && index <= currentIndex + appUsers.length) {
            final contactIndex = index - currentIndex - 1;
            return ContactListItem(ref: ref, contact: appUsers[contactIndex]);
          }
          currentIndex += appUsers.length + 1;
        }

        // Non-App Users Section
        if (hasNonAppUsers) {
          if (index == currentIndex) {
            return const ContactsSectionHeader(title: 'Invite to Sawa');
          }
          if (index > currentIndex &&
              index <= currentIndex + nonAppUsers.length) {
            final contactIndex = index - currentIndex - 1;
            return ContactListItem(
              ref: ref,
              contact: nonAppUsers[contactIndex],
            );
          }
        }

        return null;
      }, childCount: _calculateChildCount(appUsers, nonAppUsers)),
    );
  }

  int _calculateChildCount(
    List<ContactEntity> appUsers,
    List<ContactEntity> nonAppUsers,
  ) {
    int count = 0;
    if (appUsers.isNotEmpty) count += appUsers.length + 1; // +1 for header
    if (nonAppUsers.isNotEmpty) {
      count += nonAppUsers.length + 1; // +1 for header
    }
    return count;
  }
}
