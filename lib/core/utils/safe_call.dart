// import 'package:dartz/dartz.dart';
// import 'package:flutter/services.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';

// import 'errors/auth_failure.dart';
// import 'errors/failure.dart';
// import 'errors/platform_failure.dart';

// /// Whatever error is thrown, it is caught here
// Future<Either<Failure, T>> safeCall<T>(Future<T> Function() remoteCall) async {
//   try {
//     final result = await remoteCall();
//     return Right(result);
//   } on AuthException catch (e) {
//     print(e);
//     print(e.message.toString());
//     return Left(AuthFailure.fromSupabaseAuthException(e));
//   } on PlatformException catch (e) {
//     return Left(PlatformFailure.fromCode(e));
//   } catch (e) {
//     print(e);
//     print(e.toString());
//     return const Left(
//       Failure("An unexpected error occurred. Please try again."),
//     );
//   }
// }
