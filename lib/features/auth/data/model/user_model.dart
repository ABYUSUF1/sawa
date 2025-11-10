import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
abstract class UserModel with _$UserModel {
  const factory UserModel({
    required String id,
    required String phoneNumber,
    required String firstName,
    required String lastName,
    String? bio,
    String? profileImage,
    required DateTime createdAt,
    DateTime? updatedAt,
    DateTime? lastSeenAt,
    @Default(false) bool isOnline,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  factory UserModel.fromSupabaseUser(User user) => UserModel(
    id: user.id,
    phoneNumber: user.phone ?? '',
    firstName: user.userMetadata?['first_name'] ?? '',
    lastName: user.userMetadata?['last_name'] ?? '',
    bio: user.userMetadata?['bio'],
    profileImage: user.userMetadata?['profile_image'],
    createdAt: DateTime.tryParse(user.createdAt) ?? DateTime.now(),
    updatedAt: user.updatedAt != null
        ? DateTime.tryParse(user.updatedAt!)
        : null,
    isOnline: (user.userMetadata?['is_online'] as bool?) ?? false,
    lastSeenAt: user.userMetadata?['last_seen_at'] != null
        ? DateTime.tryParse(user.userMetadata!['last_seen_at'])
        : null,
  );
}
