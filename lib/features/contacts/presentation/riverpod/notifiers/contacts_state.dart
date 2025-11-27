import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../domain/entities/contact_entity.dart';

part 'contacts_state.freezed.dart';

@freezed
sealed class ContactsState with _$ContactsState {
  const factory ContactsState.loading() = _Loading;

  const factory ContactsState.success({
    required List<ContactEntity> appUserContacts,
    @Default('') String searchQuery,
    @Default([]) List<ContactEntity> filteredAppUsers,
    @Default([]) List<ContactEntity> filteredNonAppUsers,
    @Default([]) List<ContactEntity> selectedContacts,
    @Default(false) bool isSelectionMode, // <-- new
  }) = ContactsSuccess;

  const factory ContactsState.error(String message) = _Error;
}
