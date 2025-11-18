import 'package:sawa/features/auth/data/data_source/local/auth_local_data_source.dart';
import 'package:sawa/features/auth/data/data_source/remote/auth_remote_datasource.dart';
import 'package:sawa/features/auth/data/model/user_model.dart';
import 'package:sawa/features/auth/data/model/user_obx.dart';
import 'package:sawa/features/auth/domain/entity/user_entity.dart';
import '../../domain/repo/auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  final AuthRemoteDatasource _remote;
  final AuthLocalDataSource _local;

  AuthRepoImpl(this._remote, this._local);

  @override
  Future<void> signInWithPhoneNumber(String phoneNumber) async {
    // Just forward the call to remote (Supabase)
    await _remote.signInWithPhoneNumber(phoneNumber);
  }

  @override
  Future<UserEntity> verifyOtp(String otp, String phone) async {
    // 1. Verify OTP and get Supabase-authenticated user model
    final authUser = await _remote.verifyOtp(otp, phone);

    // 2. Ensure user exists in DB (get or create)
    final userModel = await _remote.getOrCreateUser(authUser);

    // 3. Cache the signed-in user locally (so app works offline)
    //    - This uses the local datasource which stores the logged-in user
    //      in a fixed slot (obxId = 1).
    //    - We assume UserModel has a toObx() mapper returning UserObx.
    _local.saveUser(userModel.toObx());

    // 4. Return domain entity
    return userModel.toEntity();
  }

  @override
  Future<void> signOut() async {
    // Sign out from Supabase
    await _remote.signOut();

    // Clear local cached signed-in user
    _local.clearUser();
  }

  @override
  Future<UserEntity> updateProfile(UserEntity user) async {
    // Update remote profile first
    final updatedModel = await _remote.updateProfile(user.toModel());

    // If the updated profile belongs to the currently cached user, update local cache
    final cached = _local.getUser();
    if (cached != null && cached.serverId == updatedModel.id) {
      _local.saveUser(updatedModel.toObx());
    }

    // Return updated domain entity
    return updatedModel.toEntity();
  }

  @override
  Future<void> setUserOnlineStatus(String userId, bool isOnline) async {
    // Remote update only; you may optionally cache lastSeen locally if needed
    await _remote.setUserOnlineStatus(userId, isOnline);

    // If it's current user, update local cache minimal fields (isOnline, lastSeenAt)
    final cached = _local.getUser();
    if (cached != null && cached.serverId == userId) {
      final updated = cached
        ..isOnline = isOnline
        ..lastSeenAt = isOnline ? null : DateTime.now().toUtc();
      _local.saveUser(updated);
    }
  }

  @override
  Future<UserEntity?> getUser(String userId) async {
    // If asking for our own user, try local cache first (fast & offline-friendly)
    final myId = _remote.userId;
    if (myId != null && myId == userId) {
      final cached = _local.getUser();
      if (cached != null) {
        print('Cached user: ${cached.serverId}');
        return cached.toModel().toEntity();
      }

      // Not cached locally → try remote and cache result
      try {
        final remoteModel = await _remote.getUser(userId);
        if (remoteModel != null) {
          _local.saveUser(remoteModel.toObx());
          return remoteModel.toEntity();
        }
        return null;
      } catch (e) {
        // remote failed (offline?) — return null (no local fallback)
        return null;
      }
    }

    // For *other* users: try remote first. You can add a separate local users box
    // for caching other users if desired (not shown here).
    try {
      final remote = await _remote.getUser(userId);
      return remote?.toEntity();
    } catch (e) {
      // remote failed — optionally fallback to local cached other-users if you implement that
      return null;
    }
  }

  @override
  String? myUserId() {
    return _remote.userId;
  }

  @override
  bool isSignedIn() {
    // Keep this remote-based since Supabase manages session tokens
    return _remote.isSignedIn;
  }
}
