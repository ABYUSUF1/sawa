// Add this to your providers file
import 'package:flutter_riverpod/legacy.dart';
import 'package:riverpod/riverpod.dart';

import '../../../../core/objectbox/object_box_provider.dart';
import '../../../../core/services/contacts/contacts_service.dart';
import '../../data/data_sources/local/contacts_local_data_source.dart';
import '../../data/data_sources/remote/contacts_remote_data_source.dart';
import '../../data/repo/contacts_repo_impl.dart';
import '../../domain/repo/contacts_repo.dart';
import 'notifiers/contacts_notifier.dart';
import 'notifiers/contacts_state.dart';

final contactsRemoteDataSourceProvider = Provider<ContactsRemoteDataSource>((
  ref,
) {
  // Return an instance of ContactsRemoteDataSource implementation
  return ContactsRemoteDataSource(
    contactsService: ref.read(contactsServiceProvider),
  );
});

final contactsLocalDataSourceProvider = Provider<ContactsLocalDataSource>((
  ref,
) {
  final obx = ref.watch(objectBoxProvider);
  return ContactsLocalDataSource(objectBox: obx);
});

final contactsRepoProvider = Provider<ContactsRepo>((ref) {
  // Return an instance of ContactsRepo implementation
  return ContactsRepoImpl(
    ref.read(contactsRemoteDataSourceProvider),
    ref.read(contactsLocalDataSourceProvider),
  );
});

final contactsNotifierProvider =
    StateNotifierProvider<ContactsNotifier, ContactsState>((ref) {
      final contactsRepo = ref.watch(contactsRepoProvider);
      return ContactsNotifier(const ContactsState.loading(), contactsRepo);
    });
