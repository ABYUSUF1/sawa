import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../../generated/locale_keys.g.dart';

class ChatsFilterChipsList extends StatefulWidget {
  const ChatsFilterChipsList({super.key});

  @override
  State<ChatsFilterChipsList> createState() => _ChatsFilterChipsListState();
}

class _ChatsFilterChipsListState extends State<ChatsFilterChipsList> {
  // --- NEW: State for filter chips ---
  @override
  Widget build(BuildContext context) {
    final filters = [
      context.tr(LocaleKeys.chat_filters_all),
      context.tr(LocaleKeys.chat_filters_unread),
      context.tr(LocaleKeys.chat_filters_groups),
      context.tr(LocaleKeys.chat_settings),
    ];
    String selectedFilter = context.tr(
      LocaleKeys.chat_filters_all,
    ); // 'All' is selected by default

    final theme = Theme.of(context);

    return SliverToBoxAdapter(
      child: Container(
        height: 52.0, // Height for padding + chip
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: filters.length,
          // Add adding to the start and end of the list
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          itemBuilder: (context, index) {
            final filter = filters[index];
            final isSelected = selectedFilter == filter;

            return Padding(
              padding: const EdgeInsets.only(
                right: 8.0,
              ), // Spacing between chips
              child: FilterChip(
                label: Text(filter),
                selected: isSelected,
                onSelected: (bool selected) {
                  if (selected) {
                    setState(() {
                      selectedFilter = filter;
                    });
                    // TODO: Add filter logic here
                  }
                },
                // Use theme-aware colors for Material 3
                selectedColor: theme.colorScheme.primaryContainer,
                labelStyle: TextStyle(
                  color: isSelected
                      ? theme.colorScheme.onPrimaryContainer
                      : theme.colorScheme.onSurfaceVariant,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                ),
                backgroundColor: theme.colorScheme.surfaceContainerHigh,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  side: BorderSide(
                    color: isSelected
                        ? Colors.transparent
                        : theme.colorScheme.outline,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
