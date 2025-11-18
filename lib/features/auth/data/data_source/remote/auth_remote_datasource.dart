import 'package:sawa/features/auth/data/model/user_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthRemoteDatasource {
  final SupabaseClient _supabase = Supabase.instance.client;
  User? get _currentUser => _supabase.auth.currentUser;
  SupabaseQueryBuilder get _usersTable => _supabase.from('users');

  /// Nullable userId
  String? get userId => _currentUser?.id;

  bool get isSignedIn =>
      _currentUser != null && _currentUser!.phoneConfirmedAt != null;

  /// Send OTP to the user's phone
  Future<void> signInWithPhoneNumber(String phoneNumber) async {
    await _supabase.auth.signInWithOtp(phone: phoneNumber);
  }

  /// Verify OTP and return authenticated Supabase user
  Future<UserModel> verifyOtp(String otp, String phone) async {
    final response = await _supabase.auth.verifyOTP(
      phone: phone,
      token: otp,
      type: OtpType.sms,
    );

    final supaUser = response.user!;
    return UserModel.fromSupabaseUser(supaUser);
  }

  /// Sign out the current user
  Future<void> signOut() async => _supabase.auth.signOut();

  /// Get user by ID (or null if not found)
  Future<UserModel?> getUser(String userId) async {
    final response = await _usersTable.select().eq('id', userId).maybeSingle();
    return response != null ? UserModel.fromJson(response) : null;
  }

  /// Create a new user in the database
  Future<void> createUser(UserModel user) async {
    await _usersTable.insert({
      ...user.toJson(),
      'created_at': DateTime.now().toUtc().toIso8601String(),
      'updated_at': DateTime.now().toUtc().toIso8601String(),
    });
  }

  /// Update user profile info
  Future<UserModel> updateProfile(UserModel user) async {
    final updatedData = {
      'first_name': user.firstName,
      'last_name': user.lastName,
      'bio': user.bio,
      'profile_image': user.profileImage,
      'updated_at': DateTime.now().toUtc().toIso8601String(),
    };

    final updated = await _usersTable
        .update(updatedData)
        .eq('id', user.id)
        .select()
        .single();

    return UserModel.fromJson(updated);
  }

  /// Update user's online/offline status
  Future<void> setUserOnlineStatus(String userId, bool isOnline) async {
    await _usersTable
        .update({
          'is_online': isOnline,
          'last_seen_at': isOnline
              ? null
              : DateTime.now().toUtc().toIso8601String(),
        })
        .eq('id', userId);
  }

  /// Get existing user or create one if not found (atomic upsert)
  Future<UserModel> getOrCreateUser(UserModel authUser) async {
    final existing = await getUser(authUser.id);
    if (existing != null) return existing;

    await _usersTable.upsert({
      ...authUser.toJson(),
      'created_at': DateTime.now().toUtc().toIso8601String(),
      'updated_at': DateTime.now().toUtc().toIso8601String(),
    });
    return authUser;
  }
}
