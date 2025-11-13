import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:sawa/core/services/contacts/contacts_service.dart';
import 'package:sawa/features/auth/data/model/user_model.dart';
import 'package:sawa/features/contacts/data/models/contact_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ContactsRemoteDataSource {
  ContactsRemoteDataSource({required this.contactsService});

  final ContactsService contactsService;
  final supabase = Supabase.instance.client;

  Future<List<Contact>> fetchContacts() async {
    final contacts = await contactsService.getAllContacts();
    return contacts;
  }

  Future<List<ContactModel>> getContactsWithAppUserStatus(
    List<Contact> allContacts,
  ) async {
    final phoneToContactMap = <String, Contact>{};

    // Create a mapping of phone numbers to their contact objects
    for (final contact in allContacts) {
      for (final phone in contact.phones) {
        phoneToContactMap[phone.number] = contact;
      }
    }

    final allContactPhoneNumbers = phoneToContactMap.keys.toList();

    final response = await supabase
        .from('users')
        .select()
        .inFilter('phone_number', allContactPhoneNumbers);

    final registeredUsers = (response as List<dynamic>)
        .map((e) => UserModel.fromJson(e as Map<String, dynamic>))
        .toList();

    final registeredPhoneNumbers = registeredUsers
        .map((user) => user.phoneNumber)
        .toSet(); // Use Set for faster lookups

    final contactModels = allContactPhoneNumbers.map((phoneNumber) {
      final contact = phoneToContactMap[phoneNumber];
      final isRegistered = registeredPhoneNumbers.contains(phoneNumber);

      return ContactModel(
        contactName:
            contact?.displayName ??
            phoneNumber, // Fallback to phone number if no name
        phoneNumber: phoneNumber,
        isAppUser: isRegistered,
        user: isRegistered
            ? registeredUsers.firstWhere(
                (user) => user.phoneNumber == phoneNumber,
              )
            : null,
      );
    }).toList();

    return contactModels;
  }
}
