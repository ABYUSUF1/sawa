import 'package:flutter/widgets.dart';

import '../../../../../core/constants/app_assets.dart';
import '../../../../../core/widgets/custom_empty_widget.dart';
import 'contacts_more_section.dart';

class ContactListEmpty extends StatelessWidget {
  const ContactListEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    return const SliverFillRemaining(
      child: Column(
        children: [
          SizedBox(height: 30),
          CustomEmptyWidget(
            svgImage: AppAssets.illustrationsEmptyContacts,
            title: 'No contacts found',
          ),
          SizedBox(height: 30),
          ContactsMoreSection(),
        ],
      ),
    );
  }
}
