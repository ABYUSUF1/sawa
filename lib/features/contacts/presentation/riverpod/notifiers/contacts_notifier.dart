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

  // Use phone numbers as unique ids for selection
  final Set<String> _selectedPhones = {};

  // -------------------------
  // Helpers
  // -------------------------
  List<ContactEntity> _selectedContactsFromCache() {
    if (_selectedPhones.isEmpty) return [];
    return _allContacts
        .where((c) => _selectedPhones.contains(c.phoneNumber))
        .toList();
  }

  void _emitSelectionState({required bool isSelectionMode}) {
    if (state is! ContactsSuccess) return;
    final cur = state as ContactsSuccess;
    state = cur.copyWith(
      selectedContacts: _selectedContactsFromCache(),
      isSelectionMode: isSelectionMode,
    );
  }

  // -------------------------
  // Core API
  // -------------------------
  Future<void> fetchContacts({bool? isRefresh}) async {
    state = const ContactsState.loading();

    try {
      final wholeContacts = await contactsRepo.fetchContacts();
      final List<ContactEntity> appUserContacts = await contactsRepo
          .getContactsWithAppUserStatus(wholeContacts, isRefresh ?? false);

      _allContacts = appUserContacts;

      // clear selection when reloading
      _selectedPhones.clear();

      state = ContactsState.success(
        appUserContacts: appUserContacts,
        searchQuery: '',
        filteredAppUsers: [],
        filteredNonAppUsers: [],
        selectedContacts: [],
        isSelectionMode: false,
      );
    } catch (e) {
      final failure = getFriendlyFailure(e);
      state = ContactsState.error(failure.errMessage);
    }
  }

  void searchContacts(String query) {
    if (state is! ContactsSuccess) return;
    final cur = state as ContactsSuccess;

    if (query.isEmpty) {
      state = cur.copyWith(
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

    state = cur.copyWith(
      searchQuery: query,
      filteredAppUsers: filteredAppUsers,
      filteredNonAppUsers: filteredNonAppUsers,
    );
  }

  void clearSearch() {
    if (state is! ContactsSuccess) return;
    final cur = state as ContactsSuccess;
    state = cur.copyWith(
      searchQuery: '',
      filteredAppUsers: [],
      filteredNonAppUsers: [],
    );
  }

  /// Called when user taps a contact in the normal list (not selection).
  Future<ContactEntity?> onContactTap(ContactEntity contact) async {
    try {
      final refreshed = await contactsRepo.refreshContactIfNeeded(contact);

      // Update cached list if present
      final idx = _allContacts.indexWhere(
        (c) => c.phoneNumber == refreshed.phoneNumber,
      );
      if (idx >= 0) {
        _allContacts[idx] = refreshed;
        if (state is ContactsSuccess) {
          final cur = state as ContactsSuccess;
          state = cur.copyWith(appUserContacts: _allContacts);
        }
      }

      return refreshed;
    } catch (e) {
      return contact;
    }
  }

  // -------------------------
  // Selection API (simplified)
  // -------------------------

  /// Enter selection mode with no selections (used by NewGroupView).
  void enableSelectionMode() {
    _selectedPhones.clear();
    _emitSelectionState(isSelectionMode: true);
  }

  /// Enter selection mode and select the supplied contact
  /// (keeps compatibility with earlier UI calls that used enterSelectionMode).
  void enterSelectionMode(ContactEntity contact) {
    _selectedPhones.clear();
    _selectedPhones.add(contact.phoneNumber);
    _emitSelectionState(isSelectionMode: true);
  }

  /// Toggle the selection of [contact].
  /// If we are not in selection mode, we automatically enter it and select the item.
  void toggleContactSelection(ContactEntity contact) {
    // ensure we only operate in success state
    if (state is! ContactsSuccess) return;

    final cur = state as ContactsSuccess;

    // If not in selection mode, start it and select the contact
    if (!cur.isSelectionMode) {
      _selectedPhones.clear();
      _selectedPhones.add(contact.phoneNumber);
      _emitSelectionState(isSelectionMode: true);
      return;
    }

    // Already in selection mode: toggle membership
    if (_selectedPhones.contains(contact.phoneNumber)) {
      _selectedPhones.remove(contact.phoneNumber);
    } else {
      _selectedPhones.add(contact.phoneNumber);
    }

    // If nothing selected, exit selection mode automatically
    final stillHasSelection = _selectedPhones.isNotEmpty;
    _emitSelectionState(isSelectionMode: stillHasSelection);
  }

  /// Exit selection mode and clear selections.
  void exitSelectionMode() {
    if (state is! ContactsSuccess) return;
    _selectedPhones.clear();
    _emitSelectionState(isSelectionMode: false);
  }

  void clearSelection() => exitSelectionMode();

  // -------------------------
  // Utilities exposed for convenience
  // -------------------------

  /// Returns a copy of currently selected contacts (read-only).
  List<ContactEntity> get selectedContacts =>
      List.unmodifiable(_selectedContactsFromCache());

  int get selectedCount => _selectedPhones.length;
}
