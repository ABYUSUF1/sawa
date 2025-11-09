import 'package:flutter/material.dart';
import 'package:sawa/core/widgets/buttons/custom_elevated_button.dart';
import 'package:sawa/core/widgets/buttons/custom_outlined_button.dart';

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
                Text("Verify your OTP", style: theme.textTheme.titleLarge),
                const SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "We have sent an OTP to ",
                      style: theme.textTheme.bodyMedium!.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                    Text(
                      "+91 1234567890",
                      style: theme.textTheme.bodyMedium!.copyWith(
                        color: theme.colorScheme.primary,
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
                CustomElevatedButton(label: "Verify Code", onTap: () {}),
                const SizedBox(height: 16),
                CustomOutlinedButton(label: "Resend", onTap: () {}),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
