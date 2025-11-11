import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sawa/features/chats/presentation/views/chats_view.dart';
import 'package:sawa/features/splash/splash_view.dart';
import 'package:sawa/features/statuses/presentation/views/statuses_view.dart';

import '../../features/auth/presentation/views/complete_your_profile_view.dart';
import '../../features/auth/presentation/views/phone_login_view.dart';
import '../../features/auth/presentation/views/verify_otp_view.dart';
import '../../features/calls/presentation/views/calls_view.dart';
import '../layout/main_layout/main_layout.dart';
import 'app_route_name.dart';
import 'app_route_path.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();

final GoRouter appRouter = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: AppRoutePaths.chats,
  routes: [
    GoRoute(
      name: AppRouteNames.splash,
      path: AppRoutePaths.splash,
      builder: (context, state) => const SplashView(),
    ),
    GoRoute(
      name: AppRouteNames.login,
      path: AppRoutePaths.login,
      builder: (context, state) => const PhoneLoginView(),
    ),
    GoRoute(
      name: AppRouteNames.verifyOtp,
      path: AppRoutePaths.verifyOtp,
      builder: (context, state) {
        final phoneNumber = state.extra as String;
        return VerifyOtpView(phoneNumber: phoneNumber);
      },
    ),
    GoRoute(
      name: AppRouteNames.completeProfile,
      path: AppRoutePaths.completeProfile,
      builder: (context, state) => const CompleteYourProfileView(),
    ),

    // Main App Routes with Bottom Nav
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) =>
          MainLayout(navigationShell: navigationShell),

      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              name: AppRouteNames.chats,
              path: AppRoutePaths.chats,
              builder: (context, state) => const ChatsView(),
            ),
          ],
        ),
        // Add empty branches for now if using more tabs
        StatefulShellBranch(
          routes: [
            GoRoute(
              name: AppRouteNames.statuses,
              path: AppRoutePaths.statuses,
              builder: (context, state) => const StatusesView(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              name: AppRouteNames.calls,
              path: AppRoutePaths.calls,
              builder: (context, state) => const CallsView(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/calls',
              builder: (context, state) =>
                  const Scaffold(body: Center(child: Text("Calls"))),
            ),
          ],
        ),
      ],
    ),
  ],
);
