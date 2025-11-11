import 'package:easy_localization/easy_localization.dart' hide TextDirection;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sawa/generated/locale_keys.g.dart';

import '../../../../core/router/app_route_name.dart';
import '../../../../core/widgets/show_custom_snack_bar.dart';
import '../riverpod/auth_providers.dart';
import '../riverpod/notifiers/verify_otp/verify_otp_state.dart';
import '../widgets/verify_otp_widgets/verify_otp_view_body.dart';

class VerifyOtpView extends ConsumerWidget {
  final String phoneNumber;
  const VerifyOtpView({super.key, required this.phoneNumber});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final otpNotifierProvider = verifyOtpNotifierProvider(phoneNumber);

    final otpState = ref.watch(otpNotifierProvider);
    final otpNotifier = ref.read(otpNotifierProvider.notifier);

    // Listen for success/error
    ref.listen<VerifyOtpState>(otpNotifierProvider, (previous, next) {
      // Only show error when it changes
      if (next.error != null && next.error != previous?.error) {
        CustomSnackBar.show(
          context,
          message: next.error!,
          type: SnackBarType.error,
        );
      }

      // Only show success when it changes
      if (next.success == true && previous?.success != true) {
        CustomSnackBar.show(
          context,
          message: context.tr(LocaleKeys.auth_verify_otp_verified),
          type: SnackBarType.success,
        );

        if (next.user!.isProfileIncomplete) {
          context.goNamed(AppRouteNames.completeProfile);
        } else {
          context.goNamed(AppRouteNames.home);
        }
      }
    });

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: VerifyOtpViewBody(
        otpNotifier: otpNotifier,
        phoneNumber: phoneNumber,
        otpState: otpState,
      ),
    );
  }
}
