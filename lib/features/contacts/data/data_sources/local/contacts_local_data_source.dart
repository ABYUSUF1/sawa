import 'package:sawa/features/auth/data/model/user_model.dart';
import 'package:sawa/features/contacts/data/models/contact_obx.dart';
import 'package:sawa/features/contacts/data/models/contact_model.dart';
import 'package:sawa/features/auth/data/model/user_obx.dart';
import 'package:sawa/core/objectbox/object_box.dart';

import '../../../../../core/objectbox/objectbox.g.dart';

class ContactsLocalDataSource {
  final ObjectBox objectBox;
  ContactsLocalDataSource({required this.objectBox});

  Box<ContactObx> get _box => objectBox.box<ContactObx>();
  Box<UserObx> get _userBox => objectBox.box<UserObx>();

  List<ContactObx> getAllContacts() => _box.getAll();

  ContactObx? getContactByPhone(String phoneNumber) {
    final q = _box.query(ContactObx_.phoneNumber.equals(phoneNumber)).build();
    final res = q.findFirst();
    q.close();
    return res;
  }

  /// Save or update a ContactObx list (bulk)
  void saveContacts(List<ContactObx> contacts) => _box.putMany(contacts);

  /// Upsert a single Contact using a remote ContactModel.
  /// This preserves other local fields if the contact already exists
  /// and sets lastCheckedAt = now.
  void upsertFromRemoteModel(ContactModel remote) {
    final now = DateTime.now();
    final existing = getContactByPhone(remote.phoneNumber);

    // Ensure user record saved (if provided)
    UserObx? userObx;
    if (remote.user != null) {
      userObx = remote.user!.toObx();
      _userBox.put(userObx);
    }

    if (existing != null) {
      // update fields
      existing.contactName = remote.contactName;
      existing.isAppUser = remote.isAppUser;
      if (userObx != null) existing.user.target = userObx;
      existing.lastCheckedAt = now;
      _box.put(existing);
    } else {
      final newObx = ContactObx(
        contactName: remote.contactName,
        phoneNumber: remote.phoneNumber,
        isAppUser: remote.isAppUser,
        lastCheckedAt: now,
      );
      if (userObx != null) newObx.user.target = userObx;
      _box.put(newObx);
    }
  }
}
