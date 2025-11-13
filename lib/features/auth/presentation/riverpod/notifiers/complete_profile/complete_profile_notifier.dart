// complete_profile_notifier.dart
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:sawa/core/riverpod/auth/global_auth_provider.dart';
import 'package:sawa/core/services/storage/bucket_names.dart';

import '../../../../../../core/services/storage/storage_service.dart';
import '../../../../../../core/utils/get_friendly_failure.dart';
import '../../auth_providers.dart';
import 'complete_profile_state.dart';

class CompleteProfileNotifier extends StateNotifier<CompleteProfileState> {
  final Ref ref;

  // form + controllers
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController bioController = TextEditingController();

  CompleteProfileNotifier(this.ref) : super(const CompleteProfileState()) {
    // Load current user values directly from AsyncValue<UserEntity?>
    final user = ref.read(globalAuthProvider).value;
    if (user != null) {
      firstNameController.text = user.firstName;
      lastNameController.text = user.lastName;
      bioController.text = user.bio;
    }
  }

  /// Set/replace picked image (UI only). Passing null will clear it.
  void setPickedImage(File? file) {
    state = state.copyWith(pickedImageFile: file, error: null);
  }

  void removePickedImage() => setPickedImage(null);

  /// Complete profile: validate, optionally upload image, update backend, update global auth
  Future<void> completeProfile() async {
    if (formKey.currentState?.validate() != true) return;

    // Get user directly from AsyncValue
    final user = ref.read(globalAuthProvider).value;
    if (user == null) {
      state = state.copyWith(error: 'No authenticated user found');
      return;
    }

    state = state.copyWith(isLoading: true, error: null, success: false);

    try {
      final repo = ref.read(authRepoProvider);

      String? imageUrl;
      final picked = state.pickedImageFile;
      if (picked != null) {
        final storageService = ref.read(supabaseStorageServiceProvider);
        imageUrl = await storageService.uploadImage(
          bucketName: BucketNames.profileImages,
          file: picked,
          userId: user.id,
        );
      }

      // build updated user
      final newUser = user.copyWith(
        firstName: firstNameController.text.trim(),
        lastName: lastNameController.text.trim(),
        bio: bioController.text.trim(),
        profileImage: imageUrl ?? user.profileImage,
        updatedAt: DateTime.now(),
        isOnline: true,
      );

      // update server
      final updatedUser = await repo.updateProfile(newUser);

      // update global auth state
      ref.read(globalAuthProvider.notifier).updateUser(updatedUser);

      // mark success and keep pickedImageFile cleared
      state = state.copyWith(
        isLoading: false,
        success: true,
        error: null,
        pickedImageFile: null,
      );
    } catch (e) {
      final failure = getFriendlyFailure(e);
      state = state.copyWith(
        isLoading: false,
        success: false,
        error: failure.errMessage,
      );
    }
  }

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    bioController.dispose();
    super.dispose();
  }
}
