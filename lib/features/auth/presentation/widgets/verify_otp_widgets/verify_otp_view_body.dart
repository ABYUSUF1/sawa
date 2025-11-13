import 'package:easy_localization/easy_localization.dart' hide TextDirection;

import 'package:flutter/material.dart';
import 'package:sawa/features/auth/presentation/riverpod/notifiers/verify_otp/verify_otp_notifier.dart';
import 'package:sawa/generated/locale_keys.g.dart';

import '../../../../../core/constants/app_assets.dart';
import '../../../../../core/utils/constant/layout_constant.dart';
import '../../../../../core/widgets/custom_illustration_widget.dart';
import '../../riverpod/notifiers/verify_otp/verify_otp_state.dart';
import 'otp_field.dart';
import 'verify_otp_check_button.dart';
import 'verify_otp_desc.dart';
import 'verify_resend_button.dart';

class VerifyOtpViewBody extends StatelessWidget {
  const VerifyOtpViewBody({
    super.key,
    required this.otpNotifier,
    required this.phoneNumber,
    required this.otpState,
  });

  final VerifyOtpNotifier otpNotifier;
  final String phoneNumber;
  final VerifyOtpState otpState;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Form(
      key: otpNotifier.formKey,
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: kMobileWidth),
            child: Column(
              children: [
                const SizedBox(height: 20),
                Text(
                  context.tr(LocaleKeys.auth_verify_your_otp),
                  style: theme.textTheme.titleLarge,
                ),
                const SizedBox(height: 5),
                VerifyOtpDesc(phoneNumber: phoneNumber),
                const SizedBox(height: 30),
                const CustomIllustrationWidget(
                  svgImage: AppAssets.illustrationsOtpVerification,
                ),
                const SizedBox(height: 50),
                OtpField(controller: otpNotifier.otpController),
                const SizedBox(height: 50),
                VerifyOtpCheckButton(
                  otpNotifier: otpNotifier,
                  otpState: otpState,
                ),
                const SizedBox(height: 16),
                VerifyResendButton(
                  otpNotifier: otpNotifier,
                  otpState: otpState,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
