import 'package:flutter/material.dart';

import '../utils/constant/layout_constant.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget mobileChild;
  final Widget tabletChild;
  final Widget? desktopChild;

  const ResponsiveLayout({
    super.key,
    required this.mobileChild,
    required this.tabletChild,
    this.desktopChild,
  });

  static bool isMobile(BuildContext context) =>
      MediaQuery.sizeOf(context).width < kMobileWidth;

  static bool isTablet(BuildContext context) =>
      MediaQuery.sizeOf(context).width >= kMobileWidth &&
      MediaQuery.sizeOf(context).width < kTabletWidth;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.sizeOf(context).width >= kTabletWidth;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final screenWidth = constraints.maxWidth;

        if (screenWidth >= kTabletWidth && desktopChild != null) {
          return desktopChild!;
        } else if (screenWidth >= kMobileWidth) {
          return tabletChild;
        } else {
          return mobileChild;
        }
      },
    );
  }
}
