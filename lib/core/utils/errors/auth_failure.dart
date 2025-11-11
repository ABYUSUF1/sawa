import 'package:easy_localization/easy_localization.dart';
import '../../../generated/locale_keys.g.dart';
import 'failure.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthFailure extends Failure {
  AuthFailure(super.errMessage);

  factory AuthFailure.fromSupabaseAuthException(AuthException e) {
    final code = (e is AuthApiException) ? e.code?.toLowerCase() : '';
    final message = e.message.toLowerCase();

    if (code == 'validation_failed') {
      return AuthFailure(LocaleKeys.error_auth_otp_invalid.tr());
    } else if (message.contains('invalid login credentials')) {
      return AuthFailure(LocaleKeys.error_auth_invalid_credential.tr());
    } else if (message.contains('email already registered')) {
      return AuthFailure(LocaleKeys.error_auth_email_already_in_use.tr());
    } else if (message.contains('invalid email')) {
      return AuthFailure(LocaleKeys.error_auth_invalid_email.tr());
    } else if (message.contains('user not found')) {
      return AuthFailure(LocaleKeys.error_auth_user_not_found.tr());
    } else if (message.contains('password')) {
      return AuthFailure(LocaleKeys.error_auth_wrong_password.tr());
    } else if (message.contains('network')) {
      return AuthFailure(LocaleKeys.error_auth_network_request_failed.tr());
    } else if (message.contains('too many requests')) {
      return AuthFailure(LocaleKeys.error_auth_too_many_requests.tr());
    } else if (code == 'sms_send_failed' ||
        message.contains('error sending confirmation otp')) {
      return AuthFailure(LocaleKeys.error_auth_otp_send_failed.tr());
    } else if (code == 'otp_expired' || message.contains('otp expired')) {
      return AuthFailure(LocaleKeys.error_auth_otp_expired.tr());
    } else {
      return AuthFailure(LocaleKeys.error_auth_default.tr());
    }
  }
}
