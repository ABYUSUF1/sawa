import '../../data/model/user_model.dart';

class UserEntity {
  final String id;
  final String phoneNumber;
  final String firstName;
  final String lastName;
  final String? bio;
  final String? profileImage;
  final DateTime createdAt;
  final DateTime? updatedAt;
  final DateTime? lastSeenAt;
  final bool isOnline;

  UserEntity({
    required this.id,
    required this.phoneNumber,
    required this.firstName,
    required this.lastName,
    required this.bio,
    required this.profileImage,
    required this.createdAt,
    required this.updatedAt,
    required this.lastSeenAt,
    required this.isOnline,
  });

  bool get isProfileIncomplete {
    return firstName.trim().isEmpty || lastName.trim().isEmpty;
  }

  String get fullName {
    return '$firstName $lastName'.trim();
  }

  bool get isBioEmpty => bio?.trim().isEmpty ?? true;

  // Copy with
  UserEntity copyWith({
    String? phoneNumber,
    String? firstName,
    String? lastName,
    String? bio,
    String? profileImage,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? lastSeenAt,
    bool? isOnline,
  }) {
    return UserEntity(
      id: id,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      bio: bio ?? this.bio,
      profileImage: profileImage ?? this.profileImage,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      lastSeenAt: lastSeenAt ?? this.lastSeenAt,
      isOnline: isOnline ?? this.isOnline,
    );
  }

  // to model
  UserModel toModel() => UserModel(
    id: id,
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
