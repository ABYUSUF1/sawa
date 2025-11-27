import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:sawa/core/router/app_route_name.dart';

class ContactsTopOptionsSection extends StatelessWidget {
  const ContactsTopOptionsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final List<Map<String, dynamic>> moreSections = [
      {
        "title": "New Group",
        "icon": Icons.group_add,
        "onTap": () {
          context.pushNamed(AppRouteNames.newGroup);
        },
      },
      {
        "title": "New Contact",
        "icon": IconsaxPlusBold.user_add,
        "onTap": () {},
      },
      {
        "title": "Chat with AIs",
        "icon": IconsaxPlusBold.magic_star,
        "onTap": () {},
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(
        moreSections.length,
        (index) => ListTile(
          minVerticalPadding: 20,
          leading: CircleAvatar(
            backgroundColor: theme.colorScheme.primary,
            child: Icon(
              moreSections[index]["icon"],
              color: theme.colorScheme.onPrimary,
            ),
          ),
          title: Text(
            moreSections[index]["title"],
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
          onTap: moreSections[index]["onTap"],
        ),
      ),
    );
  }
}
