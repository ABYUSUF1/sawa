import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sawa/core/riverpod/auth/global_auth_provider.dart';
import 'package:sawa/core/widgets/buttons/custom_elevated_button.dart';

import '../../../../core/router/app_route_name.dart';

class AccountView extends ConsumerWidget {
  const AccountView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authNotifier = ref.read(globalAuthProvider.notifier);
    final authState = ref.watch(globalAuthProvider);
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Account')),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            CustomElevatedButton(
              color: theme.colorScheme.error,
              showLoading: authState.isLoading,
              label: "Logout",
              onTap: () async {
                await authNotifier.signOut();

                if (!context.mounted) return;
                context.goNamed(AppRouteNames.login);
              },
            ),
          ],
        ),
      ),
    );
  }
}
