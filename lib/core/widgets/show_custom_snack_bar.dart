import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

import '../utils/constant/layout_constant.dart';

enum SnackBarType { success, error, info }

class CustomSnackBar {
  static void show(
    BuildContext context, {
    required String message,
    SnackBarType type = SnackBarType.info,
    Duration duration = const Duration(seconds: 3),
  }) {
    final theme = Theme.of(context);

    Color backgroundColor;
    Color textColor;
    IconData icon;

    switch (type) {
      case SnackBarType.success:
        backgroundColor = theme.colorScheme.primaryContainer;
        textColor = theme.colorScheme.onPrimaryContainer;
        icon = IconsaxPlusLinear.tick_circle;
        break;
      case SnackBarType.error:
        backgroundColor = theme.colorScheme.errorContainer;
        textColor = theme.colorScheme.onErrorContainer;
        duration = const Duration(seconds: 5);
        icon = IconsaxPlusLinear.danger;
        break;
      case SnackBarType.info:
        backgroundColor = theme.colorScheme.secondaryContainer;
        textColor = theme.colorScheme.onSecondaryContainer;
        icon = IconsaxPlusLinear.info_circle;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: duration,
        elevation: 0,
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.transparent,
        margin: const EdgeInsets.only(bottom: 30),
        content: FadeInUp(
          from: 30,
          curve: Curves.ease,
          duration: const Duration(milliseconds: 300),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: kMobileWidth),
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: backgroundColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  spacing: 16,
                  children: [
                    Icon(icon, color: textColor),
                    Expanded(
                      child: Text(message, style: TextStyle(color: textColor)),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
