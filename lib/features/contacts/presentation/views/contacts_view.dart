import 'package:flutter/material.dart';

import '../widgets/contacts_widgets/contacts_search_bar.dart';

class ContactsView extends StatelessWidget {
  const ContactsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: const Text('Contacts'),
            pinned: true,
            actions: [PopupMenuButton(itemBuilder: (_) => [])],
            bottom: const ContactsSearchBar(),
          ),
          const SliverToBoxAdapter(child: Text('Contacts')),
        ],
      ),
    );
  }
}
