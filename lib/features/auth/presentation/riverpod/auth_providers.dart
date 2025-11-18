import 'package:flutter_riverpod/legacy.dart';
import 'package:riverpod/riverpod.dart';
import 'package:sawa/features/auth/presentation/riverpod/notifiers/phone_login/phone_login_notifier.dart';
import 'package:sawa/features/auth/presentation/riverpod/notifiers/phone_login/phone_login_state.dart';

import '../../../../core/objectbox/object_box_provider.dart';
import '../../data/data_source/local/auth_local_data_source.dart';
import '../../data/data_source/remote/auth_remote_datasource.dart';
import '../../data/repo/auth_repo_impl.dart';
import '../../domain/repo/auth_repo.dart';
import 'notifiers/complete_profile/complete_profile_notifier.dart';
import 'notifiers/complete_profile/complete_profile_state.dart';
import 'notifiers/verify_otp/verify_otp_notifier.dart';
import 'notifiers/verify_otp/verify_otp_state.dart';

final authRemoteDataSourceProvider = Provider<AuthRemoteDatasource>((ref) {
  return AuthRemoteDatasource();
});

final authLocalDataSourceProvider = Provider<AuthLocalDataSource>((ref) {
  return AuthLocalDataSource(ref.watch(objectBoxProvider));
});

final authRepoProvider = Provider<AuthRepo>(
  (ref) => AuthRepoImpl(
    ref.watch(authRemoteDataSourceProvider),
    ref.watch(authLocalDataSourceProvider),
  ),
);

final phoneLoginNotifierProvider =
    StateNotifierProvider<PhoneLoginNotifier, PhoneLoginState>(
      (ref) => PhoneLoginNotifier(ref.watch(authRepoProvider)),
    );

final verifyOtpNotifierProvider = StateNotifierProvider.autoDispose
    .family<VerifyOtpNotifier, VerifyOtpState, String>(
      (ref, phone) => VerifyOtpNotifier(ref, phone),
    );

final completeProfileNotifierProvider =
    StateNotifierProvider<CompleteProfileNotifier, CompleteProfileState>(
      (ref) => CompleteProfileNotifier(ref),
    );
