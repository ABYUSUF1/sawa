import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final String label;
  final void Function()? onTap;
  final bool showLoading;
  final String loadingLabel;
  final bool fullWidth;
  final Color? textColor;
  final bool disabled;
  const CustomElevatedButton({
    super.key,
    required this.label,
    required this.onTap,
    this.showLoading = false,
    this.loadingLabel = 'Loading',
    this.fullWidth = true,
    this.textColor,
    this.disabled = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ElevatedButton(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      onPressed: disabled || showLoading ? null : onTap,
      style: ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: theme.colorScheme.primary,
        disabledBackgroundColor: theme.colorScheme.primary,
        minimumSize: fullWidth
            ? const Size(double.infinity, 50)
            : const Size.fromHeight(50),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child: showLoading
          ? FadeInDown(
              duration: const Duration(milliseconds: 300),
              curve: Curves.ease,
              from: 30,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: theme.colorScheme.onPrimary,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Text(
                    loadingLabel,
                    style: theme.textTheme.bodyMedium!.copyWith(
                      color: theme.colorScheme.onPrimary,
                    ),
                  ),
                ],
              ),
            )
          : Text(
              label,
              style: theme.textTheme.bodyMedium!.copyWith(
                color: textColor ?? theme.colorScheme.onPrimary,
              ),
            ),
    );
  }
}
