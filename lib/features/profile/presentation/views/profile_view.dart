import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:sawa/core/riverpod/auth/global_auth_provider.dart';
import 'package:sawa/core/utils/functions/format_phone_number.dart';

import '../widgets/profile_avatar.dart';

class ProfileView extends ConsumerWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(globalAuthProvider).value!;

    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ProfileAvatar(imageUrl: user.profileImage),
            const SizedBox(height: 10),
            TextButton.icon(
              onPressed: () {},
              label: const Text(
                'Change Photo',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              icon: const Icon(Icons.camera_alt),
            ),
            const SizedBox(height: 10),
            ListTile(
              leading: const Icon(IconsaxPlusLinear.user),
              title: const Text('Name'),
              subtitle: Text(user.fullName),
            ),
            ListTile(
              leading: const Icon(IconsaxPlusLinear.info_circle),
              title: const Text('Bio'),
              subtitle: Text(user.bio ?? 'N/A'),
            ),
            ListTile(
              leading: const Icon(IconsaxPlusLinear.call),
              title: const Text('Phone'),
              subtitle: Text(formatPhoneNumber(user.phoneNumber)),
            ),
          ],
        ),
      ),
    );
  }
}
