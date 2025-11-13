import 'package:flutter_contacts/flutter_contacts.dart';

class ContactsService {
  // Fetch contacts
  Future<List<Contact>> getAllContacts() async {
    final contacts = await FlutterContacts.getContacts();
    return contacts;
  }
}
