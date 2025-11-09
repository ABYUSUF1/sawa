import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:sawa/core/utils/controllers/phone_field_controller.dart';

import '../../../../core/providers/theme_providers.dart';
import '../../../../core/utils/constant/layout_constant.dart';
import '../../../../core/widgets/buttons/custom_elevated_button.dart';
import '../../../../core/widgets/text_field_widgets/custom_phone_field.dart';

class PhoneLoginView extends ConsumerWidget {
  const PhoneLoginView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Sawa",
          style: theme.textTheme.titleLarge!.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          const SizedBox(width: 8),
          IconButton(
            icon: const Icon(IconsaxPlusLinear.moon),
            onPressed: () {
              ref.read(themeModeProvider.notifier).toggle();
            },
          ),
          const SizedBox(width: 5),
          IconButton(
            icon: const Icon(IconsaxPlusLinear.translate),
            onPressed: () async {},
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: kMobileWidth),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 50),
                Text(
                  "Sign in with phone number",
                  style: theme.textTheme.titleLarge,
                ),
                const SizedBox(height: 5),
                Text(
                  "Sawa need to verify your phone number before getting started",
                  style: theme.textTheme.bodyMedium!.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
                const SizedBox(height: 30),
                CustomPhoneField(controller: PhoneFieldController()),
                const SizedBox(height: 30),
                CustomElevatedButton(label: "Continue", onTap: () {}),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
