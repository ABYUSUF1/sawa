import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:sawa/core/router/app_route_name.dart';
import 'package:sawa/generated/locale_keys.g.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        actions: [
          IconButton(
            icon: const Icon(IconsaxPlusLinear.search_normal_1),
            onPressed: () {
              // Save settings action
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListTile(
              shape: RoundedRectangleBorder(
                side: BorderSide(color: theme.colorScheme.outline, width: .3),
              ),
              minVerticalPadding: 20,
              leading: CircleAvatar(radius: 30),
              title: Text(
                'Youssef Mohamed',
                style: theme.textTheme.titleMedium!.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              subtitle: const Text('+20 10 1234 5678'),
              trailing: const Icon(Icons.edit),
              onTap: () {
                context.pushNamed(AppRouteNames.profile);
              },
            ),
            ListTile(
              leading: const Icon(IconsaxPlusLinear.key),
              title: const Text('Account'),
              subtitle: Text("Security, email"),
              onTap: () {
                // Navigate to account settings
              },
            ),
            ListTile(
              leading: const Icon(IconsaxPlusLinear.shield_security),
              title: const Text('Privacy'),
              subtitle: const Text('Manage your privacy settings'),
              onTap: () {
                // Navigate to privacy settings
              },
            ),
            ListTile(
              leading: const Icon(IconsaxPlusLinear.notification),
              title: const Text('Notifications'),
              subtitle: const Text('Messages, groups & calls'),
              onTap: () {
                // Navigate to notification settings
              },
            ),
            ListTile(
              leading: const Icon(Icons.color_lens_outlined),
              title: const Text('Appearance'),
              subtitle: const Text('Theme, font size'),
              onTap: () {
                context.pushNamed(AppRouteNames.appearance);
              },
            ),
            ListTile(
              leading: const Icon(IconsaxPlusLinear.global),
              title: const Text('Language'),
              subtitle: Text(
                context.locale.languageCode == 'en' ? 'English' : 'العربية',
              ),
              onTap: () async {
                final locale = context.locale.languageCode == 'en'
                    ? const Locale('ar')
                    : const Locale('en');
                await context.setLocale(locale);
              },
            ),
            ListTile(
              leading: const Icon(IconsaxPlusLinear.user_add),
              title: Text(context.tr(LocaleKeys.common_invite_friend)),
              subtitle: const Text('Share the app with a friend'),
              onTap: () {
                // Navigate to about page
              },
            ),
            ListTile(
              leading: const Icon(IconsaxPlusLinear.info_circle),
              title: const Text('About'),
              subtitle: const Text('Terms, privacy policy'),
              onTap: () {
                // Navigate to about page
              },
            ),
          ],
        ),
      ),
    );
  }
}
