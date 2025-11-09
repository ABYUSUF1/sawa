import 'package:easy_localization/easy_localization.dart';

// import '../../../../generated/locale_keys.g.dart';
import 'failure.dart';

class DataFailure extends Failure {
  DataFailure(super.errMessage);

  // factory DataFailure.fromFirebaseException(FirebaseException e) {
  //   switch (e.code) {
  //     case 'permission-denied':
  //       return DataFailure(LocaleKeys.error_data_permission_denied.tr());
  //     case 'not-found':
  //       return DataFailure(LocaleKeys.error_data_not_found.tr());
  //     case 'unavailable':
  //       return DataFailure(LocaleKeys.error_data_unavailable.tr());
  //     case 'unauthenticated':
  //       return DataFailure(LocaleKeys.error_data_unauthenticated.tr());
  //     case 'invalid-argument':
  //       return DataFailure(LocaleKeys.error_data_invalid_argument.tr());
  //     default:
  //       return DataFailure(LocaleKeys.error_data_general.tr());
  //   }
  // }
}
