import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sawa/features/contacts/presentation/riverpod/notifiers/contacts_state.dart';
import 'package:sawa/features/contacts/presentation/widgets/contacts_widgets/contact_list.dart';
import '../riverpod/contacts_providers.dart';
import '../widgets/contacts_widgets/contacts_app_bar.dart';

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
                  selectedContacts,
                  isSelectionMode,
                ) =>
                    // Not selectable, taps navigate
                    const ContactList(selectable: false, navigateOnTap: true),
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
}
