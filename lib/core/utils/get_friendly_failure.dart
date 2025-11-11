import 'package:flutter/services.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'errors/auth_failure.dart';
import 'errors/data_failure.dart';
import 'errors/failure.dart';
import 'errors/platform_failure.dart';

Failure getFriendlyFailure(Object e) {
  print(e.toString());

  if (e is AuthException) {
    return AuthFailure.fromSupabaseAuthException(e);
  }

  if (e is PostgrestException) {
    // You might want to inspect e.details / e.message for more precise mapping
    return DataFailure(e.message);
  }

  if (e is PlatformException) {
    return PlatformFailure.fromCode(e);
  }

  // fallback
  return const Failure("Something went wrong. Please try again.");
}
