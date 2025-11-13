import 'dart:async';
import 'package:animate_do/animate_do.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../generated/locale_keys.g.dart';

class CooldownButton extends StatefulWidget {
  final String text;
  final int cooldownSeconds;
  final bool startCounting;
  final VoidCallback onPressed;
  final bool fullWidth;
  final bool isLoading;

  const CooldownButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.startCounting,
    this.fullWidth = false,
    this.cooldownSeconds = 60,
    this.isLoading = false,
  });

  @override
  State<CooldownButton> createState() => _CooldownButtonState();
}

class _CooldownButtonState extends State<CooldownButton> {
  Timer? _timer;
  int _remaining = 0;

  @override
  void didUpdateWidget(covariant CooldownButton oldWidget) {
    super.didUpdateWidget(oldWidget);

    // if startCounting was false before and became true, start timer
    if (!oldWidget.startCounting && widget.startCounting) {
      _startCooldown();
    }
  }

  void _startCooldown() {
    _timer?.cancel();
    setState(() {
      _remaining = widget.cooldownSeconds;
    });
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remaining == 0) {
        timer.cancel();
      } else {
        setState(() => _remaining--);
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final bool isCounting = _remaining > 0;

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: theme.colorScheme.primary,
        disabledForegroundColor: theme.colorScheme.onSurface,
        minimumSize: widget.fullWidth
            ? const Size(double.infinity, 50)
            : const Size.fromHeight(50),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      onPressed: (isCounting || widget.isLoading)
          ? null
          : () {
              widget.onPressed();
            },
      child: widget.isLoading
          ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: theme.colorScheme.onSurface,
                  ),
                ),
                const SizedBox(width: 16),
                FadeInDown(
                  from: 20,
                  duration: const Duration(milliseconds: 400),
                  child: Text(context.tr(LocaleKeys.common_sending)),
                ),
              ],
            )
          : isCounting
          ? FadeInDown(
              from: 20,
              duration: const Duration(milliseconds: 400),
              child: Text(
                context.tr(
                  "LocaleKeys.common_resend_in_seconds",
                  args: [_remaining.toString()],
                ),
              ),
            )
          : Text(widget.text),
    );
  }
}
