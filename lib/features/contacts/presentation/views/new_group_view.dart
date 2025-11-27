import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:sawa/features/contacts/presentation/widgets/contacts_widgets/contact_list.dart';
import '../../domain/entities/contact_entity.dart';
import '../riverpod/contacts_providers.dart';
import '../riverpod/notifiers/contacts_notifier.dart';
import '../riverpod/notifiers/contacts_state.dart';
import '../widgets/contacts_widgets/contacts_search_bar.dart';
import '../widgets/contacts_widgets/new_group_selected_list_header.dart';

class NewGroupView extends ConsumerStatefulWidget {
  const NewGroupView({super.key});

  @override
  ConsumerState<NewGroupView> createState() => _NewGroupViewState();
}

class _NewGroupViewState extends ConsumerState<NewGroupView> {
  static const double _headerHeight = 110.0;
  late ContactsNotifier contactsNotifier;

  @override
  void initState() {
    super.initState();
    contactsNotifier = ref.read(contactsNotifierProvider.notifier);

    Future.microtask(() {
      contactsNotifier.enableSelectionMode();
    });
  }

  @override
  void dispose() {
    Future.microtask(() {
      contactsNotifier.exitSelectionMode();
    });
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(contactsNotifierProvider);
    final notifier = ref.read(contactsNotifierProvider.notifier);
    final theme = Theme.of(context);

    final isSelectionMode = state is ContactsSuccess && state.isSelectionMode;
    final selected = state is ContactsSuccess
        ? state.selectedContacts
        : <ContactEntity>[];
    final selectedCount = selected.length;

    return Scaffold(
      backgroundColor: theme.colorScheme.surfaceContainerHigh,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: theme.scaffoldBackgroundColor,
        title: (isSelectionMode && selectedCount > 0)
            ? Text('$selectedCount selected')
            : const Text('New Group'),
        bottom: ContactsSearchBar(ref: ref),
        leading: (isSelectionMode && selectedCount > 0)
            ? IconButton(
                icon: const Icon(Icons.close),
                onPressed: notifier.exitSelectionMode,
              )
            : null,
      ),

      body: CustomScrollView(
        slivers: [
          // Pinned selected participants header: stays fixed under AppBar
          if (isSelectionMode && selectedCount > 0)
            SliverPersistentHeader(
              pinned: true,
              delegate: NewGroupSelectedListHeader(
                maxHeight: _headerHeight,
                minHeight: _headerHeight,
                selectedContacts: selected,
                onRemove: (c) => notifier.toggleContactSelection(c),
              ),
            ),

          // The main contact list (selectable)
          const ContactList(selectable: true, navigateOnTap: false),
        ],
      ),
      floatingActionButton: isSelectionMode && selectedCount > 0
          ? FloatingActionButton(
              onPressed: () {
                final chosen = state.selectedContacts;
                // TODO: proceed to group details screen with `chosen`
                debugPrint(
                  'Create group with: ${chosen.map((c) => c.contactName).toList()}',
                );
              },
              child: const Icon(Icons.group_add),
            )
          : null,
    );
  }
}
