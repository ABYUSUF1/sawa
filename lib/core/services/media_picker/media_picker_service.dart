import 'dart:io';
import 'package:image_picker/image_picker.dart';

class MediaPickerService {
  final ImagePicker _picker = ImagePicker();

  /// Pick a single image from camera or gallery.
  /// imageQuality: 0-100 (null = original). maxWidth/maxHeight optional.
  Future<File?> pickSingleImage({
    required ImageSource source,
    int? imageQuality,
    double? maxWidth,
    double? maxHeight,
  }) async {
    final picked = await _picker.pickImage(
      source: source,
      imageQuality: imageQuality,
      maxWidth: maxWidth,
      maxHeight: maxHeight,
    );
    return picked == null ? null : File(picked.path);
  }

  /// Pick multiple images from gallery (Android/iOS)
  /// Returns empty list when cancelled.
  Future<List<File>> pickMultipleImages({
    int? imageQuality,
    double? maxWidth,
    double? maxHeight,
  }) async {
    final pickedFiles = await _picker.pickMultiImage(
      imageQuality: imageQuality,
      maxWidth: maxWidth,
      maxHeight: maxHeight,
    );
    return pickedFiles.map((p) => File(p.path)).toList();
  }

  /// Pick a single video from camera or gallery
  Future<File?> pickSingleVideo({
    required ImageSource source,
    Duration? maxDuration,
  }) async {
    final picked = await _picker.pickVideo(
      source: source,
      maxDuration: maxDuration,
    );
    return picked == null ? null : File(picked.path);
  }
}
