// lib/features/core/media_picker/media_picker_sheet.dart
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'media_picker_notifier.dart';
import 'media_picker_state.dart';

/// Shows a bottom sheet that returns List<File>? (null on cancel)
/// Example:
/// final result = await MediaPickerSheet.show(
///   context,
///   allowMultiple: true,
///   maxWidth: 1000,
///   maxHeight: 1000,
///   imageQuality: 85,
/// );
class MediaPickerSheet {
  static Future<List<File>?> show(
    BuildContext context, {
    bool allowMultiple = false,
    double? maxWidth,
    double? maxHeight,
    int? imageQuality,
  }) {
    return showModalBottomSheet<List<File>?>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Theme.of(context).colorScheme.surfaceContainerHigh,
      builder: (_) => SafeArea(
        child: _MediaPickerSheetBody(
          allowMultiple: allowMultiple,
          maxWidth: maxWidth,
          maxHeight: maxHeight,
          imageQuality: imageQuality,
        ),
      ),
    );
  }
}

class _MediaPickerSheetBody extends ConsumerWidget {
  final bool allowMultiple;
  final double? maxWidth;
  final double? maxHeight;
  final int? imageQuality;

  const _MediaPickerSheetBody({
    required this.allowMultiple,
    this.maxWidth,
    this.maxHeight,
    this.imageQuality,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

    final state = ref.watch(mediaPickerNotifierProvider);
    final notifier = ref.read(mediaPickerNotifierProvider.notifier);

    ref.listen<MediaPickerState>(mediaPickerNotifierProvider, (prev, next) {
      if (next.error != null) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(next.error!)));
      }
    });

    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 8),
          // Drag handle
          Container(
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: theme.colorScheme.outline,
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          const SizedBox(height: 8),
          Text('Pick images', style: Theme.of(context).textTheme.titleMedium),
          // Show optimization info if provided
          if (maxWidth != null || imageQuality != null) ...[
            const SizedBox(height: 4),
            Text(
              _getOptimizationInfo(),
              style: Theme.of(
                context,
              ).textTheme.bodySmall?.copyWith(color: Colors.grey[600]),
            ),
          ],
          const SizedBox(height: 12),
          if (state.pickedFiles.isNotEmpty)
            _PickedPreview(picked: state.pickedFiles),
          if (state.isLoading)
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: CircularProgressIndicator(),
            ),
          if (!state.isLoading)
            _OptionsColumn(
              allowMultiple: allowMultiple,
              maxWidth: maxWidth,
              maxHeight: maxHeight,
              imageQuality: imageQuality,
            ),
          const SizedBox(height: 12),
          Row(
            children: [
              const SizedBox(width: 12),
              Expanded(
                child: OutlinedButton(
                  onPressed: () {
                    notifier.clear();
                    Navigator.pop(context, null);
                  },
                  child: const Text('Cancel'),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: ElevatedButton(
                  onPressed: state.pickedFiles.isEmpty
                      ? null
                      : () {
                          final result = state.pickedFiles;
                          Navigator.pop(context, result);
                        },
                  child: Text(
                    allowMultiple
                        ? 'Confirm (${state.pickedFiles.length})'
                        : 'Use Photo',
                  ),
                ),
              ),
              const SizedBox(width: 12),
            ],
          ),
          const SizedBox(height: 12),
        ],
      ),
    );
  }

  String _getOptimizationInfo() {
    final parts = <String>[];
    if (maxWidth != null && maxHeight != null) {
      parts.add('Max size: ${maxWidth!.toInt()}x${maxHeight!.toInt()}');
    } else if (maxWidth != null) {
      parts.add('Max width: ${maxWidth!.toInt()}px');
    } else if (maxHeight != null) {
      parts.add('Max height: ${maxHeight!.toInt()}px');
    }
    if (imageQuality != null) {
      parts.add('Quality: $imageQuality%');
    }
    return parts.join(' • ');
  }
}

class _OptionsColumn extends ConsumerWidget {
  final bool allowMultiple;
  final double? maxWidth;
  final double? maxHeight;
  final int? imageQuality;

  const _OptionsColumn({
    required this.allowMultiple,
    this.maxWidth,
    this.maxHeight,
    this.imageQuality,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(mediaPickerNotifierProvider.notifier);
    return Column(
      children: [
        ListTile(
          leading: const Icon(Icons.camera_alt),
          title: const Text('Take Photo'),
          onTap: () => notifier.pickSingle(
            ImageSource.camera,
            maxWidth: maxWidth,
            maxHeight: maxHeight,
            imageQuality: imageQuality,
          ),
        ),
        ListTile(
          leading: const Icon(Icons.photo),
          title: const Text('Choose from Gallery (single)'),
          onTap: () => notifier.pickSingle(
            ImageSource.gallery,
            maxWidth: maxWidth,
            maxHeight: maxHeight,
            imageQuality: imageQuality,
          ),
        ),
        if (allowMultiple)
          ListTile(
            leading: const Icon(Icons.photo_library),
            title: const Text('Choose Multiple (Gallery)'),
            onTap: () => notifier.pickMultiple(
              maxWidth: maxWidth,
              maxHeight: maxHeight,
              imageQuality: imageQuality,
            ),
          ),
      ],
    );
  }
}

class _PickedPreview extends ConsumerWidget {
  final List<File> picked;
  const _PickedPreview({required this.picked});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(mediaPickerNotifierProvider.notifier);
    final crossAxis = MediaQuery.of(context).size.width > 600 ? 4 : 3;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: GridView.builder(
        shrinkWrap: true,
        itemCount: picked.length,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxis,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
        ),
        itemBuilder: (context, index) {
          final file = picked[index];
          return Stack(
            fit: StackFit.expand,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.file(file, fit: BoxFit.cover),
              ),
              Positioned(
                top: 6,
                right: 6,
                child: GestureDetector(
                  onTap: () => notifier.removeAt(index),
                  child: const CircleAvatar(
                    radius: 14,
                    backgroundColor: Colors.black54,
                    child: Icon(Icons.close, size: 16, color: Colors.white),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
