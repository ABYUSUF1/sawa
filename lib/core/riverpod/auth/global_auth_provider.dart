import 'package:flutter_riverpod/legacy.dart';
import 'package:sawa/core/riverpod/auth/global_auth_state.dart';
import 'package:sawa/features/auth/presentation/riverpod/auth_providers.dart';

import 'global_auth_notifier.dart';

final globalAuthProvider =
    StateNotifierProvider<GlobalAuthNotifier, GlobalAuthState>((ref) {
      return GlobalAuthNotifier(ref.watch(authRepoProvider));
    });
