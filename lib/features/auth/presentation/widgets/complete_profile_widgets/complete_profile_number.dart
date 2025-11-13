import 'package:flutter/material.dart';

import '../../../../../core/utils/functions/format_phone_number.dart';

class CompleteProfileNumber extends StatelessWidget {
  final String phone;
  const CompleteProfileNumber({super.key, required this.phone});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
      decoration: BoxDecoration(
        color: theme.colorScheme.primary.withValues(alpha: .2),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Text(
        formatPhoneNumber(phone),
        style: theme.textTheme.bodyMedium!.copyWith(
          color: theme.colorScheme.primary,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
