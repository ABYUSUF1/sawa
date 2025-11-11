import 'package:animate_do/animate_do.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../core/riverpod/auth/global_auth_provider.dart';
import '../../core/riverpod/auth/global_auth_state.dart';
import '../../core/router/app_route_name.dart';
import '../../generated/locale_keys.g.dart';

class SplashView extends ConsumerWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

    ref.listen<GlobalAuthState>(globalAuthProvider, (previous, state) {
      state.maybeWhen(
        authenticated: (user) {
          // Check if profile is complete
          if (user.firstName.isEmpty || user.lastName.isEmpty) {
            context.goNamed(AppRouteNames.completeProfile);
          } else {
            context.goNamed(AppRouteNames.home);
          }
        },
        unauthenticated: () {
          context.goNamed(AppRouteNames.login);
        },
        orElse: () {},
      );
    });

    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: FadeInDown(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeIn,
              from: 30,
              child: Text(
                context.tr(LocaleKeys.app_name),
                style: theme.textTheme.headlineLarge,
              ),
            ),
          ),
          Align(
            alignment: const Alignment(0, .8),
            child: FadeInUp(
              delay: const Duration(milliseconds: 300),
              curve: Curves.easeIn,
              duration: const Duration(milliseconds: 600),
              child: const SizedBox.square(
                dimension: 24,
                child: CircularProgressIndicator(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
