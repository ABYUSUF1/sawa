import 'package:easy_localization/easy_localization.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

// import '../../../../generated/locale_keys.g.dart';
import '../../../generated/locale_keys.g.dart';
import 'failure.dart';

class AuthFailure extends Failure {
  AuthFailure(super.errMessage);

  factory AuthFailure.fromSupabaseAuthException(AuthException e) {
    final message = e.message.toLowerCase();

    if (message.contains('invalid login credentials')) {
      return AuthFailure(LocaleKeys.error_auth_invalid_credential.tr());
    } else if (message.contains('email already registered')) {
      return AuthFailure(LocaleKeys.error_auth_email_already_in_use.tr());
    } else if (message.contains('invalid email')) {
      return AuthFailure(LocaleKeys.error_auth_invalid_email.tr());
    } else if (message.contains('user not found')) {
      return AuthFailure(LocaleKeys.error_auth_user_not_found.tr());
    } else if (message.contains('password')) {
      // covers wrong or weak password messages
      return AuthFailure(LocaleKeys.error_auth_wrong_password.tr());
    } else if (message.contains('network')) {
      return AuthFailure(LocaleKeys.error_auth_network_request_failed.tr());
    } else if (message.contains('too many requests')) {
      return AuthFailure(LocaleKeys.error_auth_too_many_requests.tr());
    } else {
      return AuthFailure(LocaleKeys.error_auth_default.tr());
    }
  }
}

// 
// I/flutter ( 5625): AuthApiException(message: Token has expired or is invalid, statusCode: 403, code: otp_expired)