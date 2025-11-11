import 'package:flutter_riverpod/legacy.dart';
import '../../../features/auth/domain/entity/user_entity.dart';
import '../../../features/auth/domain/repo/auth_repo.dart';
import 'global_auth_state.dart';

class GlobalAuthNotifier extends StateNotifier<GlobalAuthState> {
  final AuthRepo _repo;
  GlobalAuthNotifier(this._repo) : super(const GlobalAuthState.unknown()) {
    checkAuthStatus();
  }

  Future<void> checkAuthStatus() async {
    try {
      print('🔹 Checking auth status...');
      final userId = _repo.myUserId();
      print('🔹 myUserId() returned: $userId');

      if (userId == null || userId.isEmpty) {
        print('⚠️ No user ID found — setting unauthenticated');
        state = const GlobalAuthState.unauthenticated();
        return;
      }

      final currentUser = await _repo.getUser(userId);
      print('🔹 currentUser: $currentUser');

      if (currentUser == null) {
        print('⚠️ No user document found — unauthenticated');
        state = const GlobalAuthState.unauthenticated();
      } else {
        if (currentUser.firstName.isEmpty || currentUser.lastName.isEmpty) {
          print('✅ Authenticated but incomplete profile');
          state = GlobalAuthState.authenticated(currentUser.copyWith());
        } else {
          print('✅ Authenticated with full profile');
          state = GlobalAuthState.authenticated(currentUser);
        }
      }
    } catch (e, st) {
      print('❌ checkAuthStatus failed: $e\n$st');
      state = const GlobalAuthState.unauthenticated();
    }
  }

  Future<void> signOut() async {
    await _repo.signOut();
    state = const GlobalAuthState.unauthenticated();
  }

  void updateUser(UserEntity updatedUser) {
    state = GlobalAuthState.authenticated(updatedUser);
  }
}
