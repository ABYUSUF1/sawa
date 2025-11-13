import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

import '../../../../../core/router/app_route_name.dart';

class BackToLoginButton extends StatelessWidget {
  const BackToLoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return TextButton.icon(
      onPressed: () {
        context.goNamed(AppRouteNames.login);
      },
      icon: Icon(
        IconsaxPlusLinear.arrow_left,
        color: theme.colorScheme.primary,
      ),
      label: Text(
        "Back to Login",
        style: theme.textTheme.bodyMedium!.copyWith(
          color: theme.colorScheme.primary,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
