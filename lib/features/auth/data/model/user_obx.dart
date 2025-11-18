import 'package:objectbox/objectbox.dart';

import 'user_model.dart';

@Entity()
class UserObx {
  @Id()
  int obxId = 0; // ObjectBox local id

  /// Server-side id (Supabase user id)
  String serverId;

  String phoneNumber;
  String firstName;
  String lastName;
  String? profileImage; // remote URL
  String? bio;

  DateTime createdAt;
  DateTime? updatedAt;
  DateTime? lastSeenAt;
  bool isOnline;

  UserObx({
    this.obxId = 0,
    required this.serverId,
    required this.phoneNumber,
    required this.firstName,
    required this.lastName,
    this.profileImage,
    this.bio,
    required this.createdAt,
    this.updatedAt,
    this.lastSeenAt,
    this.isOnline = false,
  });
}

extension UserObxMapper on UserObx {
  UserModel toModel() {
    return UserModel(
      id: serverId,
      phoneNumber: phoneNumber,
      firstName: firstName,
      lastName: lastName,
      bio: bio,
      profileImage: profileImage,
      createdAt: createdAt,
      updatedAt: updatedAt,
      lastSeenAt: lastSeenAt,
      isOnline: isOnline,
    );
  }
}
