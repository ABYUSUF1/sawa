import 'dart:io';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final supabaseStorageServiceProvider = Provider<StorageService>(
  (ref) => StorageService(),
);

class StorageService {
  final SupabaseClient _supabase = Supabase.instance.client;
  StorageService();

  Future<String> uploadImage({
    required String userId,
    required String bucketName,
    required File file,
    String? customPath, // Optional custom path
  }) async {
    final processedFile = await _processImage(file);
    final fileBytes = await processedFile.readAsBytes();

    // Use custom path or default structure
    final path = customPath ?? '$bucketName/$userId/avatar.jpg';

    await _supabase.storage
        .from(bucketName)
        .uploadBinary(
          path,
          fileBytes,
          fileOptions: const FileOptions(cacheControl: '3600', upsert: true),
        );

    // ✅ Fixed: Use the same bucketName
    return _supabase.storage.from(bucketName).getPublicUrl(path);
  }

  /// Get image URL
  String getImageUrl(String userId, String bucketName, {String? customPath}) {
    final path = customPath ?? '$bucketName/$userId/avatar.jpg';
    return _supabase.storage.from(bucketName).getPublicUrl(path);
  }

  /// Delete image
  Future<void> deleteImage(
    String userId,
    String bucketName, {
    String? customPath,
  }) async {
    final path = customPath ?? '$bucketName/$userId/avatar.jpg';
    await _supabase.storage.from(bucketName).remove([path]);
  }

  Future<File> _processImage(File originalImage) async {
    // TODO: Implement actual image processing
    // For now, return original
    return originalImage;
  }
}
