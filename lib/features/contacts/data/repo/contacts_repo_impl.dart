import 'package:flutter_contacts/contact.dart';
import 'package:sawa/features/contacts/data/data_sources/local/contacts_local_data_source.dart';

import 'package:sawa/features/contacts/data/data_sources/remote/contacts_remote_data_source.dart';
import 'package:sawa/features/contacts/data/models/contact_model.dart';
import 'package:sawa/features/contacts/data/models/contact_obx.dart';
import 'package:sawa/features/contacts/domain/entities/contact_entity.dart';

import '../../domain/repo/contacts_repo.dart';

// TTL constant (12 hours)
const Duration contactCheckTtl = Duration(hours: 12);

class ContactsRepoImpl implements ContactsRepo {
  ContactsRepoImpl(this._remote, this._local);

  final ContactsRemoteDataSource _remote;
  final ContactsLocalDataSource _local;

  @override
  Future<List<ContactEntity>> getContactsWithAppUserStatus(
    List<Contact> phoneNumbers,
    bool isRefresh,
  ) async {
    final localContacts = _local.getAllContacts();
    if (localContacts.isNotEmpty && !isRefresh) {
      return localContacts
          .map((contact) => contact.toModel().toEntity())
          .toList();
    }

    final contactsModels = await _remote.getContactsWithAppUserStatus(
      phoneNumbers,
    );

    _local.saveContacts(contactsModels.map((model) => model.toObx()).toList());

    return contactsModels.map((model) => model.toEntity()).toList();
  }

  @override
  Future<List<Contact>> fetchContacts() {
    return _remote.fetchContacts();
  }

  /// Refreshes a single contact if needed (based on local lastCheckedAt).
  /// Returns the (possibly updated) ContactEntity.
  Future<ContactEntity> refreshContactIfNeeded(ContactEntity contact) async {
    final localObx = _local.getContactByPhone(contact.phoneNumber);

    final shouldCheck =
        localObx == null ||
        localObx.lastCheckedAt == null ||
        DateTime.now()
                .difference(localObx.lastCheckedAt!)
                .compareTo(contactCheckTtl) >=
            0;

    if (!shouldCheck) {
      // no need to check remote
      return contact;
    }

    // need to check remote for fresh status
    final remoteModel = await _remote.checkPhone(
      contact.phoneNumber,
      displayName: contact.contactName,
    );

    // update local DB
    _local.upsertFromRemoteModel(remoteModel);

    // return the updated entity
    final updatedObx = _local.getContactByPhone(contact.phoneNumber)!;
    return updatedObx.toModel().toEntity();
  }
}
