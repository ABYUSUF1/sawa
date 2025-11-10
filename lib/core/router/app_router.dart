import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/auth/presentation/views/complete_your_profile_view.dart';
import '../../features/auth/presentation/views/phone_login_view.dart';
import '../../features/auth/presentation/views/verify_otp_view.dart';
import 'app_route_name.dart';
import 'app_route_path.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();

final GoRouter appRouter = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: AppRoutePaths.login,
  routes: [
    GoRoute(
      name: AppRouteNames.login,
      path: AppRoutePaths.login,
      builder: (context, state) => const PhoneLoginView(),
    ),
    GoRoute(
      name: AppRouteNames.verifyOtp,
      path: AppRoutePaths.verifyOtp,
      builder: (context, state) => const VerifyOtpView(),
    ),
    GoRoute(
      name: AppRouteNames.completeProfile,
      path: AppRoutePaths.completeProfile,
      builder: (context, state) => const CompleteYourProfileView(),
    ),
  ],
);
