class UserEntity {
  final String id;
  final String phoneNumber;
  final String firstName;
  final String lastName;
  final String bio;
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
}
