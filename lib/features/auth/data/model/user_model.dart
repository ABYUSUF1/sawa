import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../domain/entity/user_entity.dart';
import 'user_obx.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
sealed class UserModel with _$UserModel {
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
    phoneNumber: "+${user.phone}",
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

extension UserModelX on UserModel {
  UserEntity toEntity() => UserEntity(
    id: id,
    phoneNumber: phoneNumber,
    firstName: firstName,
    lastName: lastName,
    bio: bio ?? '',
    profileImage: profileImage,
    createdAt: createdAt,
    updatedAt: updatedAt ?? createdAt,
    lastSeenAt: lastSeenAt,
    isOnline: isOnline,
  );
}

extension UserModelMapper on UserModel {
  UserObx toObx() {
    return UserObx(
      serverId: id,
      phoneNumber: phoneNumber,
      firstName: firstName,
      lastName: lastName,
      profileImage: profileImage,
      bio: bio,
      createdAt: createdAt,
      updatedAt: updatedAt,
      lastSeenAt: lastSeenAt,
      isOnline: isOnline,
    );
  }
}
