import '../../../auth/domain/entity/user_entity.dart';

class ContactEntity {
  final String contactName;
  final String phoneNumber;
  final bool isAppUser;
  final UserEntity? user;

  ContactEntity({
    required this.contactName,
    required this.phoneNumber,
    required this.isAppUser,
    required this.user,
  });

  ContactEntity copyWith({
    String? contactName,
    String? phoneNumber,
    bool? isAppUser,
    UserEntity? user,
  }) {
    return ContactEntity(
      contactName: contactName ?? this.contactName,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      isAppUser: isAppUser ?? this.isAppUser,
      user: user ?? this.user,
    );
  }
}
