import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:riverpod/riverpod.dart';

final contactsServiceProvider = Provider<ContactsService>((ref) {
  return ContactsService();
});

class ContactsService {
  // Fetch contacts
  Future<List<Contact>> getAllContacts() async {
    final permission = await FlutterContacts.requestPermission();
    if (!permission) {
      throw Exception('Contacts permission denied');
    }

    final contacts = await FlutterContacts.getContacts(
      withProperties: true,
      withPhoto: false,
    );
    return contacts;
  }
}
