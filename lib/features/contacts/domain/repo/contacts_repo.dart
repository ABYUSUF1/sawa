import 'package:flutter_contacts/contact.dart';

import '../entities/contact_entity.dart';

abstract class ContactsRepo {
  Future<List<Contact>> fetchContacts();
  Future<List<ContactEntity>> getContactsWithAppUserStatus(
    List<Contact> phoneNumbers,
    bool isRefresh,
  );
  Future<ContactEntity> refreshContactIfNeeded(ContactEntity contact);
}
