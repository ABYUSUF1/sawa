import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

class ContactsMoreSection extends StatelessWidget {
  const ContactsMoreSection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final List<Map<String, dynamic>> moreSections = [
      {
        "title": "New Contact",
        "icon": IconsaxPlusBold.user_add,
        "onTap": () {},
      },
      {
        "title": "Share invite link",
        "icon": IconsaxPlusBold.share,
        "onTap": () {},
      },
      {
        "title": "Contacts help",
        "icon": IconsaxPlusBold.message_question,
        "onTap": () {},
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsetsDirectional.only(start: 12.0, bottom: 8.0),
          child: Text(
            "More",
            style: theme.textTheme.titleSmall!.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        ...List.generate(
          moreSections.length,
          (index) => ListTile(
            leading: CircleAvatar(
              backgroundColor: theme.colorScheme.surfaceContainerLow,
              child: Icon(moreSections[index]["icon"]),
            ),
            title: Text(
              moreSections[index]["title"],
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
            onTap: moreSections[index]["onTap"],
          ),
        ),
      ],
    );
  }
}
