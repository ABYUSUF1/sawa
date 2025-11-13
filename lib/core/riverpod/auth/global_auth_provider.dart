import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../features/auth/domain/entity/user_entity.dart';
import 'global_auth_notifier.dart';

final globalAuthProvider =
    AsyncNotifierProvider<GlobalAuthNotifier, UserEntity?>(
      () => GlobalAuthNotifier(),
    );
