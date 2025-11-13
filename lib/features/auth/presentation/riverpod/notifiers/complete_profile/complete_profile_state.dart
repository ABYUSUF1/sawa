import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sawa/features/auth/domain/entity/user_entity.dart';

part 'complete_profile_state.freezed.dart';

@freezed
sealed class CompleteProfileState with _$CompleteProfileState {
  const factory CompleteProfileState({
    @Default(false) bool isLoading,
    String? error,
    @Default(false) bool success,
    File? pickedImageFile,
    UserEntity? updatedUser,
  }) = _CompleteProfileState;
}
