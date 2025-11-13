import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../auth/domain/entity/user_entity.dart';

part 'contacts_state.freezed.dart';

@freezed
sealed class ContactsState with _$ContactsState {
  const factory ContactsState.initial() = _Initial;
  const factory ContactsState.loading() = _Loading;
  const factory ContactsState.success({
    required List<UserEntity> registeredUsers,
    required List<UserEntity> unRegisteredUsers,
  }) = _Success;
  const factory ContactsState.error(String errMessage) = _Error;
}
