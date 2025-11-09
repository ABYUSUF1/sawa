import 'package:easy_localization/easy_localization.dart' hide TextDirection;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pinput/pinput.dart';

class OtpField extends StatelessWidget {
  const OtpField({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Directionality(
      textDirection: TextDirection.ltr, // force left-to-right
      child: Pinput(
        length: 6,
        controller: TextEditingController(),
        onTapOutside: (_) => FocusManager.instance.primaryFocus?.unfocus(),
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        validator: (value) => value?.length == 6
            ? null
            : " context.tr(LocaleKeys.auth_verify_otp_code_digit_warning)",
        focusedPinTheme: PinTheme(
          width: 56,
          height: 56,
          decoration: BoxDecoration(
            border: Border.all(color: theme.colorScheme.primary, width: 2),
            color: theme.colorScheme.surfaceContainerLow,
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        defaultPinTheme: PinTheme(
          width: 55,
          height: 55,
          decoration: BoxDecoration(
            color: theme.colorScheme.surfaceContainerLow,
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }
}
