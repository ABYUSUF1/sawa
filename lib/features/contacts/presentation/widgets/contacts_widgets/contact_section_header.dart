import 'package:flutter/material.dart';

class ContactsSectionHeader extends StatelessWidget {
  final String title;

  const ContactsSectionHeader({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      color: theme.colorScheme.surfaceContainerLow,
      child: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.w600,
          color: theme.colorScheme.onSurfaceVariant,
          fontSize: 14,
        ),
      ),
    );
  }
}
