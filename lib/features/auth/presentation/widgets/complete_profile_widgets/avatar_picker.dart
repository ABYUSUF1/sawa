import 'package:flutter/material.dart';
import 'package:sawa/core/services/media_picker/media_picker_sheet.dart';
import 'package:sawa/features/auth/presentation/riverpod/notifiers/complete_profile/complete_profile_notifier.dart';

import '../../riverpod/notifiers/complete_profile/complete_profile_state.dart';

class AvatarPicker extends StatelessWidget {
  const AvatarPicker({
    super.key,
    required this.cPState,
    required this.cPNotifier,
  });

  final CompleteProfileState cPState;
  final CompleteProfileNotifier cPNotifier;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Stack(
      children: [
        CircleAvatar(
          radius: 50,
          backgroundColor: theme.colorScheme.primary.withAlpha(38),
          backgroundImage: cPState.pickedImageFile != null
              ? FileImage(cPState.pickedImageFile!)
              : null,
          child: cPState.pickedImageFile == null
              ? Icon(Icons.person, size: 60, color: theme.colorScheme.primary)
              : null,
        ),
        Positioned(
          bottom: 0,
          right: 4,
          child: InkWell(
            onTap: () async {
              final file = await MediaPickerSheet.show(
                context,
                maxWidth: 800, // Perfect for profiles
                maxHeight: 800,
                imageQuality: 85, // Good quality with compression
              );
              if (file != null && file.isNotEmpty) {
                cPNotifier.setPickedImage(file.first);
              }
            },
            borderRadius: BorderRadius.circular(20),
            child: CircleAvatar(
              radius: 16,
              backgroundColor: theme.colorScheme.primary,
              child: const Icon(
                Icons.camera_alt,
                size: 16,
                color: Colors.white,
              ),
            ),
          ),
        ),
        if (cPState.pickedImageFile != null)
          Positioned(
            bottom: 0,
            left: 4,
            child: InkWell(
              onTap: () => cPNotifier.removePickedImage(),
              child: CircleAvatar(
                radius: 16,
                backgroundColor: theme.colorScheme.error,
                child: const Icon(Icons.close, size: 16, color: Colors.white),
              ),
            ),
          ),
      ],
    );
  }
}
