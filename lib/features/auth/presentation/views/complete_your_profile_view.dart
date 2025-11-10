import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sawa/core/widgets/buttons/custom_elevated_button.dart';
import 'package:sawa/generated/locale_keys.g.dart';

import '../../../../core/utils/constant/layout_constant.dart';
import '../../../../core/utils/validators.dart';
import '../../../../core/widgets/text_field_widgets/custom_text_field.dart';

class CompleteYourProfileView extends StatelessWidget {
  const CompleteYourProfileView({super.key});

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
                const SizedBox(height: 30),
                // Avatar picker
                Stack(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundColor: theme.colorScheme.primary.withOpacity(
                        0.15,
                      ),
                      child: Icon(
                        Icons.person,
                        size: 60,
                        color: theme.colorScheme.primary,
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 4,
                      child: InkWell(
                        onTap: () {
                          // TODO: handle image picker
                        },
                        borderRadius: BorderRadius.circular(20),
                        child: CircleAvatar(
                          radius: 16,
                          backgroundColor: theme.colorScheme.primary,
                          child: const Icon(
                            Icons.camera_alt,
                            size: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                CustomTextField(
                  controller: TextEditingController(),
                  title: context.tr(LocaleKeys.auth_first_name),
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  controller: TextEditingController(),
                  title: context.tr(LocaleKeys.auth_last_name),
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  controller: TextEditingController(),
                  maxLines: 5,
                  title: context.tr(LocaleKeys.auth_bio),
                ),
                const SizedBox(height: 30),
                CustomElevatedButton(
                  label: context.tr(LocaleKeys.common_save),
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
