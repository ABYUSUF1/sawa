import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'destinations.dart';

class MainLayoutMobileView extends StatelessWidget {
  const MainLayoutMobileView({
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
    final currentDestination = destinations[navigationShell.currentIndex];
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Stack(
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(child: navigationShell),
            MediaQuery.removePadding(
              context: context,
              removeTop: true,
              removeBottom: true,
              child: NavigationBar(
                backgroundColor: theme.colorScheme.surfaceContainerHigh,
                indicatorColor: theme.colorScheme.primaryContainer,
                selectedIndex: navigationShell.currentIndex,
                onDestinationSelected: navigationShell.goBranch,
                labelTextStyle: WidgetStateTextStyle.resolveWith((states) {
                  final isSelected = states.contains(WidgetState.selected);
                  return TextStyle(
                    color: isSelected
                        ? theme.colorScheme.onSurface
                        : theme.colorScheme.onSurface.withValues(alpha: .8),
                    fontWeight: isSelected
                        ? FontWeight.bold
                        : FontWeight.normal,
                  );
                }),
                destinations: destinations
                    .map(
                      (d) => NavigationDestination(
                        icon: Icon(
                          d.icon,
                          color: theme.colorScheme.onSurface.withValues(
                            alpha: .8,
                          ),
                        ),
                        selectedIcon: Icon(
                          d.selectedIcon,
                          color: isDarkMode
                              ? theme.colorScheme.primaryFixedDim
                              : theme.colorScheme.primary,
                        ),
                        label: d.label,
                      ),
                    )
                    .toList(),
              ),
            ),
          ],
        ),

        // ✅ Floating button overlay using Stack
        if (currentDestination.floatingIcon != null)
          Positioned(
            right: 16,
            bottom: 100, // Aligns above NavigationBar
            child: ZoomIn(
              key: ValueKey("floating-${currentDestination.label}"),
              curve: Curves.ease,
              duration: const Duration(milliseconds: 300),
              child: FloatingActionButton(
                onPressed: currentDestination.onFloatTapped,
                child: Icon(currentDestination.floatingIcon),
              ),
            ),
          ),
      ],
    );
  }
}
