import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

class ProfileAvatar extends StatelessWidget {
  final String? imageUrl;
  const ProfileAvatar({super.key, this.imageUrl});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return CircleAvatar(
      radius: 80,
      backgroundColor: theme.colorScheme.primary.withValues(alpha: .2),
      backgroundImage: imageUrl != null ? NetworkImage(imageUrl!) : null,
      child: imageUrl == null
          ? Icon(
              IconsaxPlusBold.user,
              size: 80,
              color: theme.colorScheme.primary,
            )
          : null,
    );
  }
}
