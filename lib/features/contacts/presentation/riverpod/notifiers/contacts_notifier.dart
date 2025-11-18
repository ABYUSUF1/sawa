import 'package:flutter_riverpod/legacy.dart';
import 'package:sawa/core/utils/functions/get_friendly_failure.dart';
import 'package:sawa/features/contacts/domain/repo/contacts_repo.dart';
import 'package:sawa/features/contacts/presentation/riverpod/notifiers/contacts_state.dart';
import '../../../domain/entities/contact_entity.dart';

class ContactsNotifier extends StateNotifier<ContactsState> {
  ContactsNotifier(super.state, this.contactsRepo) {
    fetchContacts();
  }

  final ContactsRepo contactsRepo;
  List<ContactEntity> _allContacts = [];

  Future<void> fetchContacts({bool? isRefresh}) async {
    state = const ContactsState.loading();

    try {
      final wholeContacts = await contactsRepo.fetchContacts();
      final List<ContactEntity> appUserContacts = await contactsRepo
          .getContactsWithAppUserStatus(wholeContacts, isRefresh ?? false);

      _allContacts = appUserContacts;
      state = ContactsState.success(
        appUserContacts: appUserContacts,
        searchQuery: '',
      );
    } catch (e) {
      final failure = getFriendlyFailure(e);

      state = ContactsState.error(failure.errMessage);
    }
  }

  void searchContacts(String query) {
    if (state is! ContactsSuccess) return;

    final currentState = state as ContactsSuccess;

    if (query.isEmpty) {
      state = currentState.copyWith(
        searchQuery: '',
        filteredAppUsers: [],
        filteredNonAppUsers: [],
      );
      return;
    }

    final filteredContacts = _allContacts.where((contact) {
      return contact.contactName.toLowerCase().contains(query.toLowerCase()) ||
          contact.phoneNumber.contains(query);
    }).toList();

    final filteredAppUsers = filteredContacts
        .where((c) => c.isAppUser)
        .toList();
    final filteredNonAppUsers = filteredContacts
        .where((c) => !c.isAppUser)
        .toList();

    state = currentState.copyWith(
      searchQuery: query,
      filteredAppUsers: filteredAppUsers,
      filteredNonAppUsers: filteredNonAppUsers,
    );
  }

  void clearSearch() {
    if (state is ContactsSuccess) {
      final currentState = state as ContactsSuccess;
      state = currentState.copyWith(
        searchQuery: '',
        filteredAppUsers: [],
        filteredNonAppUsers: [],
      );
    }
  }

  /// Called when user taps a contact in search/list.
  /// Performs the TTL check + remote refresh if needed, then returns the final ContactEntity.
  Future<ContactEntity?> onContactTap(ContactEntity contact) async {
    try {
      // Optionally set a UI state to indicate checking status (omitted for brevity)

      final refreshed = await contactsRepo.refreshContactIfNeeded(contact);

      // Update cached list in notifier if needed
      final idx = _allContacts.indexWhere(
        (c) => c.phoneNumber == refreshed.phoneNumber,
      );
      if (idx >= 0) {
        _allContacts[idx] = refreshed;
        if (state is ContactsSuccess) {
          final cur = state as ContactsSuccess;
          state = cur.copyWith(appUserContacts: _allContacts); // update UI list
        }
      }

      return refreshed;
    } catch (e) {
      // handle errors (optional)
      return contact;
    }
  }
}
