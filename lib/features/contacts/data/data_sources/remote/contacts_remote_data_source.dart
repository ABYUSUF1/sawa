import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:sawa/core/services/contacts/contacts_service.dart';
import 'package:sawa/features/auth/data/model/user_model.dart';
import 'package:sawa/features/contacts/data/models/contact_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../../core/constants/supabase_tables.dart';

class ContactsRemoteDataSource {
  ContactsRemoteDataSource({required this.contactsService});

  final ContactsService contactsService;
  final supabase = Supabase.instance.client;

  Future<List<Contact>> fetchContacts() async {
    return await contactsService.getAllContacts();
  }

  /// Fetch all contacts and check which ones are app users
  Future<List<ContactModel>> getContactsWithAppUserStatus(
    List<Contact> allContacts,
  ) async {
    // ---------------------------------------------------------
    // 1) Normalize + filter only contacts with valid phone numbers
    // ---------------------------------------------------------
    final validNumbers = allContacts
        .where((c) => c.phones.isNotEmpty)
        .map((c) => c.phones.first.normalizedNumber)
        .where((n) => n.isNotEmpty)
        .toSet() // remove duplicates
        .toList();

    if (validNumbers.isEmpty) return [];

    // ---------------------------------------------------------
    // 2) Build a map number → Contact (O(1) lookup)
    // ---------------------------------------------------------
    final numberToContact = {
      for (final c in allContacts)
        if (c.phones.isNotEmpty && c.phones.first.normalizedNumber.isNotEmpty)
          c.phones.first.normalizedNumber: c,
    };

    // ---------------------------------------------------------
    // 3) Fetch app users from Supabase in batches (efficient)
    // ---------------------------------------------------------
    const chunkSize = 400; // safe number
    List<Map<String, dynamic>> allUserRows = [];

    for (var i = 0; i < validNumbers.length; i += chunkSize) {
      final chunk = validNumbers.sublist(
        i,
        i + chunkSize > validNumbers.length
            ? validNumbers.length
            : i + chunkSize,
      );

      final response = await supabase
          .from(SupabaseTables.users)
          .select()
          .inFilter('phone_number', chunk);

      allUserRows.addAll(response);
    }

    // Convert DB rows → UserModel
    final appUsers = allUserRows.map((row) => UserModel.fromJson(row)).toList();

    // Extract only phone numbers from app users
    final appUserNumbers = appUsers.map((u) => u.phoneNumber).toSet();

    // ---------------------------------------------------------
    // 4) Build ContactModel list for app users
    // ---------------------------------------------------------
    final appUserContacts = appUsers.map((user) {
      final contact = numberToContact[user.phoneNumber];

      return ContactModel(
        contactName: contact?.displayName ?? user.phoneNumber,
        phoneNumber: user.phoneNumber,
        isAppUser: true,
        user: user,
      );
    }).toList();

    // ---------------------------------------------------------
    // 5) Build ContactModel list for non-app users
    // ---------------------------------------------------------
    final nonAppUserContacts = numberToContact.entries
        .where((entry) => !appUserNumbers.contains(entry.key))
        .map((entry) {
          final contact = entry.value;
          final number = entry.key;

          return ContactModel(
            contactName: contact.displayName,
            phoneNumber: number,
            isAppUser: false,
            user: null,
          );
        })
        .toList();

    // ---------------------------------------------------------
    // 6) Combine them and return
    // ---------------------------------------------------------
    return [...appUserContacts, ...nonAppUserContacts];
  }

  /// Check a single phone number on the server and return
  /// a ContactModel. If not found, returns a ContactModel with isAppUser=false.
  Future<ContactModel> checkPhone(
    String phoneNumber, {
    String? displayName,
  }) async {
    // Query users table for this phone
    final row = await supabase
        .from(SupabaseTables.users)
        .select()
        .eq('phone_number', phoneNumber)
        .maybeSingle();

    if (row == null) {
      // Not an app user
      return ContactModel(
        contactName: displayName ?? phoneNumber,
        phoneNumber: phoneNumber,
        isAppUser: false,
        user: null,
      );
    }

    final userModel = UserModel.fromJson(row);
    return ContactModel(
      contactName:
          displayName ?? '${userModel.firstName} ${userModel.lastName}',
      phoneNumber: userModel.phoneNumber,
      isAppUser: true,
      user: userModel,
    );
  }
}
