import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class CustomOutlinedButton extends StatelessWidget {
  final String label;
  final void Function()? onTap;
  final bool showLoading;
  final bool fullWidth;
  final Color? textColor;
  final bool disabled;
  const CustomOutlinedButton({
    super.key,
    required this.label,
    required this.onTap,
    this.showLoading = false,
    this.fullWidth = true,
    this.textColor,
    this.disabled = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return OutlinedButton(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      onPressed: disabled
          ? null
          : showLoading
          ? null
          : onTap,
      style: OutlinedButton.styleFrom(
        elevation: 0,
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
              child: const SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(strokeWidth: 2),
              ),
            )
          : Text(
              label,
              style: theme.textTheme.bodyMedium!.copyWith(
                color: disabled
                    ? theme.colorScheme.onSurfaceVariant
                    : textColor ?? theme.colorScheme.primary,
              ),
            ),
    );
  }
}
