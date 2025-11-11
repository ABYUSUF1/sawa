import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../../generated/locale_keys.g.dart';

class VerifyOtpDesc extends StatelessWidget {
  const VerifyOtpDesc({super.key, required this.phoneNumber});

  final String phoneNumber;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: context.tr(LocaleKeys.auth_verify_otp_desc_1),
            style: theme.textTheme.bodyMedium!.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
          // Force phone number to be LTR using Unicode embedding
          TextSpan(
            text: "\u202A$phoneNumber\u202C\n",
            style: theme.textTheme.bodyMedium!.copyWith(
              color: theme.colorScheme.primary,
              fontWeight: FontWeight.w600,
            ),
          ),
          TextSpan(
            text: context.tr(LocaleKeys.auth_verify_otp_desc_2),
            style: theme.textTheme.bodyMedium!.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
      textAlign: TextAlign.center,
    );
  }
}
