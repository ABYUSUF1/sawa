import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sawa/core/utils/functions/validators.dart';
import 'package:sawa/core/widgets/buttons/custom_elevated_button.dart';
import 'package:sawa/features/auth/presentation/riverpod/notifiers/complete_profile/complete_profile_notifier.dart';
import 'package:sawa/features/auth/presentation/widgets/complete_profile_widgets/complete_profile_number.dart';
import 'package:sawa/generated/locale_keys.g.dart';

import '../../../../../core/utils/constant/layout_constant.dart';
import '../../../../../core/widgets/text_field_widgets/custom_text_field.dart';
import '../../riverpod/notifiers/complete_profile/complete_profile_state.dart';
import 'avatar_picker.dart';
import 'back_to_login_button.dart';

class CompleteYourProfileViewBody extends StatelessWidget {
  const CompleteYourProfileViewBody({
    super.key,
    required this.cPNotifier,
    required this.cPState,
  });

  final CompleteProfileNotifier cPNotifier;
  final CompleteProfileState cPState;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Form(
      key: cPNotifier.formKey,
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 20.0),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: kMobileWidth),
            child: Column(
              children: [
                Text(
                  context.tr(LocaleKeys.auth_complete_your_profile),
                  style: theme.textTheme.titleLarge,
                ),
                const SizedBox(height: 5),
                Text(
                  context.tr(LocaleKeys.auth_complete_your_profile_desc),
                  style: theme.textTheme.bodyMedium!.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
                const SizedBox(height: 16),
                CompleteProfileNumber(phone: cPNotifier.phone),
                const SizedBox(height: 16),
                // Avatar picker
                AvatarPicker(cPState: cPState, cPNotifier: cPNotifier),
                const SizedBox(height: 5),
                Text(
                  context.tr(LocaleKeys.common_optional),
                  style: theme.textTheme.titleSmall!.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  controller: cPNotifier.firstNameController,
                  title: context.tr(LocaleKeys.auth_first_name),
                  validator: (p0) => Validators.validateName(
                    cPNotifier.firstNameController.text,
                    false,
                  ),
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  controller: cPNotifier.lastNameController,
                  validator: (p0) => Validators.validateName(
                    cPNotifier.lastNameController.text,
                    false,
                  ),
                  title: context.tr(LocaleKeys.auth_last_name),
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  controller: cPNotifier.bioController,
                  maxLines: 5,
                  title: context.tr(LocaleKeys.auth_bio),
                ),
                const SizedBox(height: 16),
                CustomElevatedButton(
                  label: context.tr(LocaleKeys.common_save),
                  showLoading: cPState.isLoading,
                  loadingLabel: context.tr(LocaleKeys.common_saving),
                  onTap: () async {
                    await cPNotifier.completeProfile();
                  },
                ),
                const SizedBox(height: 16),

                const BackToLoginButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
