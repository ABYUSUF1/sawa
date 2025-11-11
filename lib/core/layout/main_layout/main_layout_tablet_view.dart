import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'destinations.dart';
import 'main_layout_mobile_view.dart';

class MainLayoutTabletView extends StatelessWidget {
  const MainLayoutTabletView({
    super.key,
    required this.navigationShell,
    required this.theme,
    required this.destinations,
  });

  final StatefulNavigationShell navigationShell;
  final ThemeData theme;
  final List<Destinations> destinations;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 5,
          child: MainLayoutMobileView(
            navigationShell: navigationShell,
            theme: theme,
            destinations: destinations,
          ),
        ),
        Expanded(
          flex: 7,
          child: Container(
            color: theme.colorScheme.surfaceContainerHighest,
            child: const Center(
              child: Text(
                "Right panel (tablet view)",
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
