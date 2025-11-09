// import 'package:easy_localization/easy_localization.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';

// // import '../../../../generated/locale_keys.g.dart';
// import 'failure.dart';

// class AuthFailure extends Failure {
//   AuthFailure(super.errMessage);

//   // factory AuthFailure.fromFirebaseAuthException(FirebaseAuthException e) {
//   //   switch (e.code) {
//   //     case 'invalid-credential':
//   //       return AuthFailure(LocaleKeys.error_auth_invalid_credential.tr());
//   //     case 'email-already-in-use':
//   //       return AuthFailure(LocaleKeys.error_auth_email_already_in_use.tr());
//   //     case 'invalid-email':
//   //       return AuthFailure(LocaleKeys.error_auth_invalid_email.tr());
//   //     case 'user-disabled':
//   //       return AuthFailure(LocaleKeys.error_auth_user_disabled.tr());
//   //     case 'user-not-found':
//   //       return AuthFailure(LocaleKeys.error_auth_user_not_found.tr());
//   //     case 'wrong-password':
//   //       return AuthFailure(LocaleKeys.error_auth_wrong_password.tr());
//   //     case 'account-exists-with-different-credential':
//   //       return AuthFailure(
//   //         LocaleKeys.error_auth_account_exists_with_different_credential.tr(),
//   //       );
//   //     case 'user-cancelled':
//   //       return AuthFailure(LocaleKeys.error_auth_user_cancelled.tr());
//   //     case 'network-request-failed':
//   //       return AuthFailure(LocaleKeys.error_auth_network_request_failed.tr());
//   //     case 'too-many-requests':
//   //       return AuthFailure(LocaleKeys.error_auth_too_many_requests.tr());
//   //     case 'invalid-phone-number':
//   //       return AuthFailure(LocaleKeys.error_auth_invalid_phone_number.tr());
//   //     case 'missing-phone-number':
//   //       return AuthFailure(LocaleKeys.error_auth_missing_phone_number.tr());
//   //     case 'quota-exceeded':
//   //       return AuthFailure(LocaleKeys.error_auth_quota_exceeded.tr());
//   //     case 'session-expired':
//   //       return AuthFailure(LocaleKeys.error_auth_session_expired.tr());
//   //     case 'sms-retrieval-timeout':
//   //       return AuthFailure(LocaleKeys.error_auth_sms_timeout.tr());
//   //     case 'invalid-verification-code':
//   //       return AuthFailure(
//   //         LocaleKeys.error_auth_invalid_verification_code.tr(),
//   //       );
//   //     default:
//   //       return AuthFailure(LocaleKeys.error_auth_default.tr());
//   //   }
//   // }

//   factory AuthFailure.fromSupabaseAuthException(AuthException e) {
//     final message = e.message.toLowerCase();

//     if (message.contains('invalid login credentials')) {
//       return AuthFailure(LocaleKeys.error_auth_invalid_credential.tr());
//     } else if (message.contains('email already registered')) {
//       return AuthFailure(LocaleKeys.error_auth_email_already_in_use.tr());
//     } else if (message.contains('invalid email')) {
//       return AuthFailure(LocaleKeys.error_auth_invalid_email.tr());
//     } else if (message.contains('user not found')) {
//       return AuthFailure(LocaleKeys.error_auth_user_not_found.tr());
//     } else if (message.contains('password')) {
//       // covers wrong or weak password messages
//       return AuthFailure(LocaleKeys.error_auth_wrong_password.tr());
//     } else if (message.contains('network')) {
//       return AuthFailure(LocaleKeys.error_auth_network_request_failed.tr());
//     } else if (message.contains('too many requests')) {
//       return AuthFailure(LocaleKeys.error_auth_too_many_requests.tr());
//     } else {
//       return AuthFailure(LocaleKeys.error_auth_default.tr());
//     }
//   }
// }

// // 
// // I/flutter ( 5625): AuthApiException(message: Token has expired or is invalid, statusCode: 403, code: otp_expired)