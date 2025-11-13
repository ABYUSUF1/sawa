import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:riverpod/riverpod.dart';

import '../../../../../../core/utils/functions/get_friendly_failure.dart';
import '../../auth_providers.dart';
import 'verify_otp_state.dart';

class VerifyOtpNotifier extends StateNotifier<VerifyOtpState> {
  final Ref ref;
  final String phone;
  Timer? _timer;
  final TextEditingController otpController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  VerifyOtpNotifier(this.ref, this.phone) : super(const VerifyOtpState());

  void reset() {
    _timer?.cancel();
    otpController.clear();
    state = const VerifyOtpState();
  }

  Future<void> resendOtp() async {
    if (formKey.currentState?.validate() != true) return;

    state = state.copyWith(isResending: true, error: null, success: false);

    try {
      final repo = ref.read(authRepoProvider);
      await repo.signInWithPhoneNumber(phone);
      _startCountdown();
    } catch (e) {
      final failure = getFriendlyFailure(e);
      state = state.copyWith(error: failure.errMessage, success: false);
    } finally {
      state = state.copyWith(isResending: false);
    }
  }

  Future<void> verifyOtp() async {
    if (formKey.currentState?.validate() != true) return;

    state = state.copyWith(isVerifying: true, error: null, success: false);

    try {
      final repo = ref.read(authRepoProvider);
      final userEntity = await repo.verifyOtp(otpController.text, phone);

      state = state.copyWith(success: true, user: userEntity);
    } catch (e) {
      final failure = getFriendlyFailure(e);
      state = state.copyWith(error: failure.errMessage, success: false);
    } finally {
      state = state.copyWith(isVerifying: false);
    }
  }

  void _startCountdown([int seconds = 60]) {
    _timer?.cancel();
    state = state.copyWith(secondsRemaining: seconds);

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      final current = state.secondsRemaining ?? 0;
      if (current > 0) {
        state = state.copyWith(secondsRemaining: current - 1);
      } else {
        timer.cancel();
        state = state.copyWith(secondsRemaining: null);
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    otpController.dispose();
    super.dispose();
  }
}
