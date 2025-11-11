import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../features/auth/domain/entity/user_entity.dart';

part 'global_auth_state.freezed.dart';

@freezed
class GlobalAuthState with _$GlobalAuthState {
  const factory GlobalAuthState.unknown() = _Unknown; // Initial state
  const factory GlobalAuthState.unauthenticated() = _Unauthenticated;
  const factory GlobalAuthState.authenticated(UserEntity user) = _Authenticated;
}

extension GlobalAuthStateX on GlobalAuthState {
  UserEntity get user => whenOrNull(authenticated: (user) => user)!;
}
