import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../features/auth/domain/entity/user_entity.dart';
import '../../../features/auth/domain/repo/auth_repo.dart';
import '../../../features/auth/presentation/riverpod/auth_providers.dart';

class GlobalAuthNotifier extends AsyncNotifier<UserEntity?> {
  AuthRepo get _repo => ref.read(authRepoProvider);

  @override
  Future<UserEntity?> build() async {
    return await checkAuthStatus();
  }

  Future<UserEntity?> checkAuthStatus() async {
    try {
      final userId = _repo.myUserId();

      if (userId == null || userId.isEmpty) {
        return null;
      }

      final currentUser = await _repo.getUser(userId);

      if (currentUser == null) {
        return null;
      }

      return currentUser;
    } catch (e) {
      return null;
    }
  }

  Future<void> signOut() async {
    await _repo.signOut();
    state = const AsyncData(null);
  }

  void updateUser(UserEntity updatedUser) {
    state = AsyncData(updatedUser);
  }

  // Helper getter for profile completion check
  bool get isProfileComplete {
    final user = state.value;
    if (user == null) return false;
    return user.firstName.isNotEmpty && user.lastName.isNotEmpty;
  }
}
