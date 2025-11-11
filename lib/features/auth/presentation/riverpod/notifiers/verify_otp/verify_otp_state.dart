import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sawa/features/auth/domain/entity/user_entity.dart';

part 'verify_otp_state.freezed.dart';

@freezed
sealed class VerifyOtpState with _$VerifyOtpState {
  const factory VerifyOtpState({
    String? error,
    @Default(false) bool success,
    int? secondsRemaining,
    @Default(false) bool isResending,
    @Default(false) bool isVerifying,
    UserEntity? user,
  }) = _VerifyOtpState;
}
