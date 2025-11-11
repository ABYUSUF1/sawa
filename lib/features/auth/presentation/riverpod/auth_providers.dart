import 'package:flutter_riverpod/legacy.dart';
import 'package:riverpod/riverpod.dart';
import 'package:sawa/features/auth/presentation/riverpod/notifiers/phone_login/phone_login_notifier.dart';
import 'package:sawa/features/auth/presentation/riverpod/notifiers/phone_login/phone_login_state.dart';

import '../../data/data_source/auth_remote_datasource.dart';
import '../../data/repo/auth_repo_impl.dart';
import '../../domain/repo/auth_repo.dart';
import 'notifiers/complete_profile/complete_profile_notifier.dart';
import 'notifiers/complete_profile/complete_profile_state.dart';
import 'notifiers/verify_otp/verify_otp_notifier.dart';
import 'notifiers/verify_otp/verify_otp_state.dart';

final authRemoteDataSourceProvider = Provider<AuthRemoteDatasource>((ref) {
  return AuthRemoteDatasource();
});

final authRepoProvider = Provider<AuthRepo>(
  (ref) => AuthRepoImpl(ref.watch(authRemoteDataSourceProvider)),
);

final phoneLoginNotifierProvider =
    StateNotifierProvider<PhoneLoginNotifier, PhoneLoginState>(
      (ref) => PhoneLoginNotifier(ref),
    );

final verifyOtpNotifierProvider = StateNotifierProvider.autoDispose
    .family<VerifyOtpNotifier, VerifyOtpState, String>(
      (ref, phone) => VerifyOtpNotifier(ref, phone),
    );

final completeProfileNotifierProvider =
    StateNotifierProvider<CompleteProfileNotifier, CompleteProfileState>(
      (ref) => CompleteProfileNotifier(ref),
    );
