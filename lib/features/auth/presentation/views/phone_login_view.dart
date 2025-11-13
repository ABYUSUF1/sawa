import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:sawa/generated/locale_keys.g.dart';

import '../../../../core/riverpod/theme_providers.dart';
import '../widgets/phone_login_widgets/phone_login_view_body.dart';

class PhoneLoginView extends ConsumerWidget {
  const PhoneLoginView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          context.tr(LocaleKeys.app_name),
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
            onPressed: () async {
              await context.setLocale(
                context.locale == const Locale('en')
                    ? const Locale('ar')
                    : const Locale('en'),
              );
            },
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: const PhoneLoginViewBody(),
    );
  }
}
