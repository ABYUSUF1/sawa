import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sawa/features/auth/presentation/views/verify_otp_view.dart';

import '../../features/auth/presentation/views/complete_your_profile_view.dart';
import '../../features/auth/presentation/views/phone_login_view.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();

final GoRouter appRouter = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/completeProfile',
  routes: [
    GoRoute(
      path: '/login',
      builder: (context, state) => const PhoneLoginView(),
    ),
    GoRoute(
      path: '/VerifyOtp',
      builder: (context, state) => const VerifyOtpView(),
    ),
    GoRoute(
      path: '/completeProfile',
      builder: (context, state) => const CompleteYourProfileView(),
    ),
  ],
);
