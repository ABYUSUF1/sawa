import 'package:flutter/material.dart';

/// Describes a bottom navigation destination:
/// - icon and selectedIcon: for NavigationBar
/// - optional floatingIcon and onFloatTapped for floating button
class Destinations {
  final String label;
  final IconData icon;
  final IconData selectedIcon;
  final IconData? floatingIcon;
  final void Function()? onFloatTapped;

  const Destinations({
    required this.selectedIcon,
    required this.label,
    required this.icon,
    this.floatingIcon,
    this.onFloatTapped,
  });
}
