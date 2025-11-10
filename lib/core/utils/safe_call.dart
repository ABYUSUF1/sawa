import 'package:dartz/dartz.dart';
import 'package:flutter/services.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'errors/auth_failure.dart';
import 'errors/failure.dart';
import 'errors/platform_failure.dart';

/// Whatever error is thrown, it is caught here
Future<T> safeCall<T>(Future<T> Function() call) async {
  try {
    return await call();
  } on AuthException catch (e) {
    print("Auth error: ${e.message}");
    throw e; // rethrow so notifier can catch
  } on PostgrestException catch (e) {
    print("API error: ${e.message}");
    throw e;
  } on PlatformException catch (e) {
    print("Platform error: ${e.code}");
    throw e;
  } catch (e) {
    print("Unexpected error: $e");
    throw Exception("Unexpected error");
  }
}
