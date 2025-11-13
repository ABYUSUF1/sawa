import 'package:flutter/material.dart';
import 'package:flutter_riverpod/legacy.dart';

import '../../../../../../core/utils/functions/get_friendly_failure.dart';
import '../../../../domain/repo/auth_repo.dart';
import 'phone_login_state.dart';

class PhoneLoginNotifier extends StateNotifier<PhoneLoginState> {
  final AuthRepo repo;
  final TextEditingController phoneController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  PhoneLoginNotifier(this.repo) : super(const PhoneLoginState.initial());

  Future<void> signInWithPhoneNumber() async {
    if (formKey.currentState?.validate() != true) return;

    state = const PhoneLoginState.loading();
    try {
      await repo.signInWithPhoneNumber(phoneController.text);

      state = const PhoneLoginState.success();
    } catch (e) {
      final failure = getFriendlyFailure(e);
      state = PhoneLoginState.error(failure.errMessage);
    }
  }

  @override
  void dispose() {
    phoneController.dispose();
    super.dispose();
  }
}
