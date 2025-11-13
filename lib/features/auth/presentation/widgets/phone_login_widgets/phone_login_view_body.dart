import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sawa/core/router/app_route_name.dart';
import 'package:sawa/core/widgets/show_custom_snack_bar.dart';
import 'package:sawa/features/auth/presentation/riverpod/auth_providers.dart';
import 'package:sawa/features/auth/presentation/riverpod/notifiers/phone_login/phone_login_state.dart';
import 'package:sawa/generated/locale_keys.g.dart';

import '../../../../../core/utils/constant/layout_constant.dart';
import '../../../../../core/widgets/buttons/custom_elevated_button.dart';
import 'custom_phone_field.dart';

class PhoneLoginViewBody extends ConsumerWidget {
  const PhoneLoginViewBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

    final loginState = ref.watch(phoneLoginNotifierProvider);
    final loginNotifier = ref.read(phoneLoginNotifierProvider.notifier);

    ref.listen<PhoneLoginState>(phoneLoginNotifierProvider, (previous, next) {
      next.whenOrNull(
        success: () {
          context.pushNamed(
            AppRouteNames.verifyOtp,
            extra: loginNotifier.phoneController.text,
          );
        },
        error: (message) {
          CustomSnackBar.show(
            context,
            message: message,
            type: SnackBarType.error,
          );
        },
      );
    });

    return Form(
      key: loginNotifier.formKey,
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: kMobileWidth),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 50),
                Text(
                  context.tr(LocaleKeys.auth_sign_in_with_phone_number),
                  style: theme.textTheme.titleLarge,
                ),
                const SizedBox(height: 5),
                Text(
                  context.tr(LocaleKeys.auth_sign_in_with_phone_number_desc),
                  style: theme.textTheme.bodyMedium!.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
                const SizedBox(height: 30),

                CustomPhoneField(controller: loginNotifier.phoneController),

                const SizedBox(height: 30),
                CustomElevatedButton(
                  label: context.tr(LocaleKeys.common_continue),
                  loadingLabel: context.tr(LocaleKeys.auth_signing_in),
                  showLoading: loginState.isLoading,
                  onTap: () async {
                    await loginNotifier.signInWithPhoneNumber();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
