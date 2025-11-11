import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../../core/widgets/buttons/custom_outlined_button.dart';
import '../../../../../generated/locale_keys.g.dart';
import '../../riverpod/notifiers/verify_otp/verify_otp_notifier.dart';
import '../../riverpod/notifiers/verify_otp/verify_otp_state.dart';

class VerifyResendButton extends StatelessWidget {
  final VerifyOtpNotifier otpNotifier;
  final VerifyOtpState otpState;
  const VerifyResendButton({
    super.key,
    required this.otpNotifier,
    required this.otpState,
  });

  @override
  Widget build(BuildContext context) {
    return CustomOutlinedButton(
      label: otpState.secondsRemaining != null
          ? context.tr(
              LocaleKeys.common_resend_in_seconds,
              args: [otpState.secondsRemaining.toString()],
            )
          : context.tr(LocaleKeys.auth_verify_otp_resend_code),
      showLoading: otpState.isResending,
      disabled:
          otpState.isResending ||
          otpState.isVerifying ||
          otpState.secondsRemaining != null,
      onTap:
          otpState.isResending ||
              otpState.isVerifying ||
              otpState.secondsRemaining != null
          ? null
          : () async {
              await otpNotifier.resendOtp();
            },
    );
  }
}
