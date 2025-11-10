import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sawa/core/widgets/buttons/custom_elevated_button.dart';
import 'package:sawa/core/widgets/buttons/custom_outlined_button.dart';
import 'package:sawa/generated/locale_keys.g.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/utils/constant/layout_constant.dart';
import '../../../../core/widgets/custom_illustration_widget.dart';
import '../widgets/otp_field.dart';

class VerifyOtpView extends StatelessWidget {
  const VerifyOtpView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: kMobileWidth),
            child: Column(
              children: [
                Text(
                  context.tr(LocaleKeys.auth_verify_your_otp),
                  style: theme.textTheme.titleLarge,
                ),
                const SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      context.tr(LocaleKeys.auth_verify_otp_desc_1),
                      style: theme.textTheme.bodyMedium!.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                    Text(
                      "+91 1234567890 ",
                      style: theme.textTheme.bodyMedium!.copyWith(
                        color: theme.colorScheme.primary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      context.tr(LocaleKeys.auth_verify_otp_desc_2),
                      style: theme.textTheme.bodyMedium!.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                const CustomIllustrationWidget(
                  svgImage: AppAssets.illustrationsOtpVerification,
                ),
                const SizedBox(height: 50),
                const OtpField(),
                const SizedBox(height: 50),
                CustomElevatedButton(
                  label: context.tr(LocaleKeys.auth_verify_otp_check_button),
                  onTap: () {},
                ),
                const SizedBox(height: 16),
                CustomOutlinedButton(
                  label: context.tr(LocaleKeys.auth_verify_otp_resend_code),
                  onTap: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
