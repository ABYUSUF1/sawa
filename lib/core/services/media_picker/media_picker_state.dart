// lib/features/core/media_picker/media_picker_state.dart
import 'dart:io';

class MediaPickerState {
  final bool isLoading;
  final List<File> pickedFiles;
  final String? error;

  const MediaPickerState({
    this.isLoading = false,
    this.pickedFiles = const [],
    this.error,
  });

  MediaPickerState copyWith({
    bool? isLoading,
    List<File>? pickedFiles,
    String? error, // pass null to clear
  }) {
    return MediaPickerState(
      isLoading: isLoading ?? this.isLoading,
      pickedFiles: pickedFiles ?? this.pickedFiles,
      error: error,
    );
  }
}
