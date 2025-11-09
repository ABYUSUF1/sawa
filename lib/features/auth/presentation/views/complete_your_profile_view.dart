import 'package:flutter/material.dart';
import 'package:sawa/core/widgets/buttons/custom_elevated_button.dart';

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
                  "Complete your profile",
                  style: theme.textTheme.titleLarge,
                ),
                const SizedBox(height: 5),
                Text(
                  "Complete your profile to get started",
                  style: theme.textTheme.bodyMedium!.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
                const SizedBox(height: 30),
                CircleAvatar(
                  radius: 50,
                  backgroundColor: theme.colorScheme.primary,
                ),
                const SizedBox(height: 30),
                CustomTextField(
                  controller: TextEditingController(),
                  title: "First Name",
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  controller: TextEditingController(),
                  title: "Last Name",
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  controller: TextEditingController(),
                  maxLines: 5,
                  title: "Bio",
                ),
                const SizedBox(height: 30),
                CustomElevatedButton(label: "Save", onTap: () {}),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
