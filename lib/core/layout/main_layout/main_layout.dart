import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:sawa/core/layout/responsive_layout.dart';

import '../../router/app_route_name.dart';
import 'destinations.dart';
import 'main_layout_mobile_view.dart';
import 'main_layout_tablet_view.dart';

/// MainLayout handles the overall app layout with bottom navigation,
/// floating action buttons, and responsive design for mobile/tablet.
class MainLayout extends StatelessWidget {
  final StatefulNavigationShell navigationShell;
  const MainLayout({super.key, required this.navigationShell});

  @override
  Widget build(BuildContext context) {
    final List<Destinations> destinations = [
      Destinations(
        label: "Chats",
        icon: IconsaxPlusLinear.message,
        selectedIcon: IconsaxPlusBold.message,
        floatingIcon: IconsaxPlusBold.message_add_1,
        onFloatTapped: () {
          context.pushNamed(AppRouteNames.contacts);
        },
      ),
      Destinations(
        label: "Statuses",
        icon: IconsaxPlusLinear.status,
        selectedIcon: IconsaxPlusBold.status,
      ),
      Destinations(
        label: "Calls",
        icon: IconsaxPlusLinear.call,
        selectedIcon: IconsaxPlusBold.call,
        floatingIcon: IconsaxPlusBold.call_add,
        onFloatTapped: () {
          debugPrint("Add call tapped");
        },
      ),
    ];

    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.colorScheme.surfaceContainerHigh,
      body: SafeArea(
        top: false,
        child: ResponsiveLayout(
          mobileChild: MainLayoutMobileView(
            navigationShell: navigationShell,
            theme: theme,
            destinations: destinations,
          ),
          tabletChild: MainLayoutTabletView(
            navigationShell: navigationShell,
            theme: theme,
            destinations: destinations,
          ),
        ),
      ),
    );
  }
}
