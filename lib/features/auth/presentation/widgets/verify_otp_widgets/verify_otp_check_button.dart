import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../../core/widgets/buttons/custom_elevated_button.dart';
import '../../../../../generated/locale_keys.g.dart';
import '../../riverpod/notifiers/verify_otp/verify_otp_notifier.dart';
import '../../riverpod/notifiers/verify_otp/verify_otp_state.dart';

class VerifyOtpCheckButton extends StatelessWidget {
  final VerifyOtpNotifier otpNotifier;
  final VerifyOtpState otpState;
  const VerifyOtpCheckButton({
    super.key,
    required this.otpNotifier,
    required this.otpState,
  });

  @override
  Widget build(BuildContext context) {
    return CustomElevatedButton(
      label: context.tr(LocaleKeys.auth_verify_otp_check_button),
      loadingLabel: context.tr(LocaleKeys.auth_verifying_otp),
      showLoading: otpState.isVerifying,
      onTap: otpState.isResending || otpState.isVerifying
          ? null
          : () async {
              await otpNotifier.verifyOtp();
            },
    );
  }
}
