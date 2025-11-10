import 'package:sawa/features/auth/data/model/user_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthRemoteDatasource {
  final _supabase = Supabase.instance.client;

  // Sign in with phone number
  Future<void> signInWithPhoneNumber(String phoneNumber) async {
    await _supabase.auth.signInWithOtp(phone: phoneNumber);
  }

  // Verify OTP
  Future<UserModel> verifyOtp(String otp, String phone) async {
    final response = await _supabase.auth.verifyOTP(
      phone: phone,
      token: otp,
      type: OtpType.sms,
    );

    final supaUser = response.user!;
    final userModel = UserModel.fromSupabaseUser(supaUser);

    return userModel;
  }

  // Sign out
  Future<void> signOut() async {
    await _supabase.auth.signOut();
  }

  // Update profile
  Future<void> updateProfile(UserModel user) async {
    await _supabase
        .from('users')
        .update({
          'first_name': user.firstName,
          'last_name': user.lastName,
          'bio': user.bio,
          'profile_image': user.profileImage,
          'updated_at': DateTime.now().toIso8601String(),
        })
        .eq('id', user.id);
  }

  Future<void> setUserOnlineStatus(String userId, bool isOnline) async {
    await _supabase
        .from('users')
        .update({
          'is_online': isOnline,
          'last_seen_at': isOnline ? null : DateTime.now().toIso8601String(),
        })
        .eq('id', userId);
  }
}
