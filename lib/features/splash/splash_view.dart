import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:vector_graphics/vector_graphics.dart';

import '../../core/constants/app_assets.dart';
import '../../core/riverpod/auth/global_auth_provider.dart';
import '../../core/riverpod/auth/global_auth_state.dart';
import '../../core/router/app_route_name.dart';

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
            context.goNamed(AppRouteNames.chats);
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
              child: VectorGraphic(
                loader: const AssetBytesLoader(AppAssets.logosSawaLogo),
                width: 30,
                height: 30,
                colorFilter: ColorFilter.mode(
                  theme.colorScheme.onSurface,
                  BlendMode.srcIn,
                ),
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
