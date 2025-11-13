// splash_view.dart
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:vector_graphics/vector_graphics.dart';

import '../../core/constants/app_assets.dart';
import '../../core/riverpod/auth/global_auth_provider.dart';
import '../../core/router/app_route_name.dart';
import '../auth/domain/entity/user_entity.dart';

class SplashView extends ConsumerWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Listen for auth state changes and navigate when ready
    ref.listen<AsyncValue<UserEntity?>>(globalAuthProvider, (previous, next) {
      next.whenOrNull(
        data: (user) {
          _navigateBasedOnAuth(user, context);
        },
        error: (error, stack) {
          context.goNamed(AppRouteNames.login);
        },
      );
    });

    // Just show loading UI, navigation is handled by listener
    return _buildSplashScreen(context);
  }

  void _navigateBasedOnAuth(UserEntity? user, BuildContext context) {
    if (user == null) {
      context.goNamed(AppRouteNames.login);
    } else if (user.firstName.isEmpty || user.lastName.isEmpty) {
      context.goNamed(AppRouteNames.completeProfile);
    } else {
      context.goNamed(AppRouteNames.chats);
    }
  }

  Widget _buildSplashScreen(BuildContext context) {
    final theme = Theme.of(context);
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
          // Align(
          //   alignment: const Alignment(0, .8),
          //   child: FadeInUp(
          //     delay: const Duration(milliseconds: 300),
          //     curve: Curves.easeIn,
          //     duration: const Duration(milliseconds: 600),
          //     child: SizedBox.square(
          //       dimension: 24,
          //       child: CircularProgressIndicator(
          //         color: theme.colorScheme.onSurface,
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
