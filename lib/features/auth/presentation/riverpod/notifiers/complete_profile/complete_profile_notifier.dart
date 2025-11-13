// complete_profile_notifier.dart
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:sawa/core/riverpod/auth/global_auth_provider.dart';
import 'package:sawa/core/services/storage/bucket_names.dart';

import '../../../../../../core/services/storage/storage_service.dart';
import '../../../../../../core/utils/functions/get_friendly_failure.dart';
import '../../auth_providers.dart';
import 'complete_profile_state.dart';

class CompleteProfileNotifier extends StateNotifier<CompleteProfileState> {
  final Ref ref;

  // Controllers - now we can pre-fill from state.user
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController bioController = TextEditingController();
  late final String phone;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  CompleteProfileNotifier(this.ref) : super(const CompleteProfileState()) {
    _initializeFromUser();
  }

  void _initializeFromUser() {
    // Initialize controllers from current user state
    final user = ref.read(globalAuthProvider).value;
    state = state.copyWith(updatedUser: user);
    phone = state.updatedUser?.phoneNumber ?? '';
    firstNameController.text = state.updatedUser?.firstName ?? '';
    lastNameController.text = state.updatedUser?.lastName ?? '';
    bioController.text = state.updatedUser?.bio ?? '';
  }

  /// Update form fields and rebuild UI reactively
  void updateFirstName(String value) {
    state = state.copyWith(
      updatedUser: state.updatedUser?.copyWith(firstName: value),
      error: null, // Clear error when user types
    );
  }

  void updateLastName(String value) {
    state = state.copyWith(
      updatedUser: state.updatedUser?.copyWith(lastName: value),
      error: null,
    );
  }

  void updateBio(String value) {
    state = state.copyWith(
      updatedUser: state.updatedUser?.copyWith(bio: value),
      error: null,
    );
  }

  /// Set temporary picked image (UI only)
  void setPickedImage(File? file) {
    state = state.copyWith(pickedImageFile: file, error: null);
  }

  void removePickedImage() => setPickedImage(null);

  /// Complete profile - now much cleaner
  Future<void> completeProfile() async {
    if (formKey.currentState?.validate() != true) return;

    if (state.isLoading) return; // Prevent multiple submissions

    state = state.copyWith(isLoading: true, error: null);

    try {
      final repo = ref.read(authRepoProvider);

      String? imageUrl = state.updatedUser?.profileImage;
      final pickedImage = state.pickedImageFile;

      // Upload new image if one was picked
      if (pickedImage != null) {
        final storageService = ref.read(supabaseStorageServiceProvider);
        imageUrl = await storageService.uploadImage(
          bucketName: BucketNames.profileImages,
          file: pickedImage,
          userId: state.updatedUser!.id,
        );
      }

      // Build updated user with current state
      final updatedUser = state.updatedUser?.copyWith(
        firstName: firstNameController.text.trim(),
        lastName: lastNameController.text.trim(),
        bio: bioController.text.trim(),
        profileImage: imageUrl,
        updatedAt: DateTime.now(),
        isOnline: true,
      );

      // Update server
      final serverUser = await repo.updateProfile(updatedUser!);

      // Update global auth state
      ref.read(globalAuthProvider.notifier).updateUser(serverUser);

      // Update local state with server response
      state = state.copyWith(
        isLoading: false,
        success: true,
        updatedUser: serverUser, // Use the user returned from server
        pickedImageFile: null, // Clear temporary file
      );
    } catch (e) {
      final failure = getFriendlyFailure(e);
      state = state.copyWith(isLoading: false, error: failure.errMessage);
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
