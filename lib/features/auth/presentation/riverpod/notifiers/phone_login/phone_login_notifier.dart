import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:sawa/core/widgets/text_field_widgets/phone_field/phone_field_controller.dart';

import '../../../../../../core/utils/get_friendly_failure.dart';
import '../../auth_providers.dart';
import 'phone_login_state.dart';

class PhoneLoginNotifier extends StateNotifier<PhoneLoginState> {
  final Ref ref;
  final PhoneFieldController phoneController = PhoneFieldController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  PhoneLoginNotifier(this.ref) : super(const PhoneLoginState.initial());

  Future<void> signInWithPhoneNumber() async {
    if (!formKey.currentState!.validate()) return;

    state = const PhoneLoginState.loading();
    try {
      final repo = ref.read(authRepoProvider);
      await repo.signInWithPhoneNumber(phoneController.e164);

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
