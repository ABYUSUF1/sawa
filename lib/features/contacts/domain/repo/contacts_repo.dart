import 'package:flutter_contacts/contact.dart';
import 'package:sawa/features/auth/domain/entity/user_entity.dart';

abstract class ContactsRepo {
  Future<List<Contact>> fetchContacts();
  Future<List<UserEntity>> fetchRegisteredContacts(List<String> phoneNumbers);
}
