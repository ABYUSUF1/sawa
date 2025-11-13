import 'package:flutter_contacts/contact.dart';

import 'package:sawa/features/auth/domain/entity/user_entity.dart';

import '../../domain/repo/contacts_repo.dart';

class ContactsRepoImpl implements ContactsRepo {
  @override
  Future<List<UserEntity>> fetchAppUserContacts(List<String> phoneNumbers) {
    // TODO: implement fetchAppUserContacts
    throw UnimplementedError();
  }

  @override
  Future<List<Contact>> fetchContacts() {
    // TODO: implement fetchContacts
    throw UnimplementedError();
  }
}
