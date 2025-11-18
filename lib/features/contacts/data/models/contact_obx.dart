import 'package:objectbox/objectbox.dart';

import '../../../auth/data/model/user_obx.dart';
import 'contact_model.dart';

@Entity()
class ContactObx {
  @Id()
  int id = 0;

  String contactName;
  String phoneNumber;
  bool isAppUser;

  final ToOne<UserObx> user = ToOne<UserObx>();

  /// When the last remote check was performed
  DateTime? lastCheckedAt;

  ContactObx({
    this.id = 0,
    required this.contactName,
    required this.phoneNumber,
    this.isAppUser = false,
    this.lastCheckedAt,
  });
}

extension ContactObxMapper on ContactObx {
  ContactModel toModel() {
    return ContactModel(
      contactName: contactName,
      phoneNumber: phoneNumber,
      isAppUser: isAppUser,
      user: user.target?.toModel(),
    );
  }
}
