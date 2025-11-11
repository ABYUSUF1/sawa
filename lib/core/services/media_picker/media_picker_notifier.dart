// lib/features/core/media_picker/media_picker_notifier.dart
import 'dart:io';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:riverpod/legacy.dart';
import 'media_picker_state.dart';
import 'media_picker_service.dart';

// Service provider (for DI, simple)
final mediaPickerServiceProvider = Provider<MediaPickerService>((ref) {
  return MediaPickerService();
});

// Notifier provider (autoDispose recommended)
final mediaPickerNotifierProvider =
    StateNotifierProvider.autoDispose<MediaPickerNotifier, MediaPickerState>(
      (ref) => MediaPickerNotifier(ref.read(mediaPickerServiceProvider)),
    );

class MediaPickerNotifier extends StateNotifier<MediaPickerState> {
  final MediaPickerService _service;

  MediaPickerNotifier(this._service) : super(const MediaPickerState());

  /// Pick a single image
  Future<void> pickSingle(
    ImageSource source, {
    int? imageQuality,
    double? maxWidth,
    double? maxHeight,
  }) async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final file = await _service.pickSingleImage(
        source: source,
        imageQuality: imageQuality,
        maxWidth: maxWidth,
        maxHeight: maxHeight,
      );
      if (file == null) {
        // user canceled or permission denied
        state = state.copyWith(isLoading: false);
        return;
      }

      state = state.copyWith(isLoading: false, pickedFiles: [file]);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  /// Pick multiple images from gallery
  Future<void> pickMultiple({
    int? imageQuality,
    double? maxWidth,
    double? maxHeight,
  }) async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final files = await _service.pickMultipleImages(
        imageQuality: imageQuality,
        maxWidth: maxWidth,
        maxHeight: maxHeight,
      );

      state = state.copyWith(isLoading: false, pickedFiles: files);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  /// Clear any picked images / errors
  void clear() {
    state = const MediaPickerState();
  }

  /// remove single index (for when user deletes preview before confirm)
  void removeAt(int index) {
    final newList = List<File>.from(state.pickedFiles)..removeAt(index);
    state = state.copyWith(pickedFiles: newList);
  }
}
