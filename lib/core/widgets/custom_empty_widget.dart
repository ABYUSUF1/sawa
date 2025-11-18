import 'package:flutter/material.dart';
import 'package:sawa/core/widgets/custom_illustration_widget.dart';

class CustomEmptyWidget extends StatelessWidget {
  final String svgImage;
  final String title;
  final String? desc;
  const CustomEmptyWidget({
    super.key,
    required this.svgImage,
    required this.title,
    this.desc,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: [
        CustomIllustrationWidget(svgImage: svgImage),
        const SizedBox(height: 20),
        Text(title, style: theme.textTheme.titleLarge),
        const SizedBox(height: 5),
        Text(
          desc ?? '',
          style: theme.textTheme.bodyMedium!.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
          ),
        ),
      ],
    );
  }
}
