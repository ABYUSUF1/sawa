import 'package:flutter/material.dart';
import 'package:vector_graphics/vector_graphics.dart';

import 'responsive_layout.dart';

class CustomIllustrationWidget extends StatelessWidget {
  final String svgImage;
  const CustomIllustrationWidget({super.key, required this.svgImage});

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final isMobile = ResponsiveLayout.isMobile(context);
    return VectorGraphic(
      loader: AssetBytesLoader(svgImage),
      width: isMobile ? 180 : 250,
      height: isMobile ? 180 : 250,
      colorFilter: ColorFilter.mode(
        isDarkMode ? const Color.fromARGB(255, 206, 212, 218) : Colors.black,
        BlendMode.srcIn,
      ),
    );
  }
}
