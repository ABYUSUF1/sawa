import 'package:sawa/features/auth/domain/entity/user_entity.dart';

import '../../domain/repo/auth_repo.dart';
import '../data_source/auth_remote_datasource.dart';
import '../model/user_model.dart';

class AuthRepoImpl implements AuthRepo {
  final AuthRemoteDatasource _remote;
  AuthRepoImpl(this._remote);

  @override
  Future<void> signInWithPhoneNumber(String phoneNumber) async {
    await _remote.signInWithPhoneNumber(phoneNumber);
  }

  @override
  Future<UserEntity> verifyOtp(String otp, String phone) async {
    final authUser = await _remote.verifyOtp(otp, phone);
    final user = await _remote.getOrCreateUser(authUser);

    return user.toEntity();
  }

  @override
  Future<void> signOut() async {
    await _remote.signOut();
  }

  @override
  Future<UserEntity> updateProfile(UserEntity user) async {
    final updatedModel = await _remote.updateProfile(user.toModel());
    return updatedModel.toEntity();
  }

  @override
  Future<void> setUserOnlineStatus(String userId, bool isOnline) async {
    await _remote.setUserOnlineStatus(userId, isOnline);
  }

  @override
  Future<UserEntity?> getUser(String userId) async {
    final userModel = await _remote.getUser(userId);
    return userModel?.toEntity();
  }

  @override
  String? myUserId() {
    return _remote.userId;
  }

  @override
  bool isSignedIn() {
    return _remote.isSignedIn;
  }
}
