import 'package:sawa/features/auth/domain/entity/user_entity.dart';

abstract class AuthRepo {
  Future<void> signInWithPhoneNumber(String phoneNumber);
  Future<UserEntity> verifyOtp(String otp, String phone);
  Future<void> signOut();
  Future<UserEntity> updateProfile(UserEntity user);
  Future<void> setUserOnlineStatus(String userId, bool isOnline);
  Future<UserEntity?> getUser(String userId);
  String? myUserId();
  bool isSignedIn();
}
