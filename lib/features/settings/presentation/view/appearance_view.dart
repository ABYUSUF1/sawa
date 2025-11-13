import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:sawa/core/riverpod/theme_providers.dart';

final fontSizeProvider = StateProvider<FontSizeOption>(
  (ref) => FontSizeOption.medium,
);

enum FontSizeOption { small, medium, large }

class AppearanceView extends ConsumerWidget {
  const AppearanceView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeProvider);
    final fontSize = ref.watch(fontSizeProvider);

    final List<Map<String, dynamic>> appearanceOptions = [
      {
        'icon': Icons.brightness_6,
        'title': 'Theme',
        'subtitle': _getThemeSubtitle(themeMode),
        "onTap": () {
          _showThemeDialog(context, ref);
        },
      },
      {
        'icon': Icons.text_fields,
        'title': 'Font Size',
        'subtitle': _getFontSizeSubtitle(fontSize),
        "onTap": () {
          _showFontSizeDialog(context, ref);
        },
      },
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Appearance Settings')),
      body: ListView.separated(
        padding: const EdgeInsets.all(12),
        itemCount: appearanceOptions.length,
        separatorBuilder: (_, __) => const Divider(),
        itemBuilder: (BuildContext context, int index) {
          final option = appearanceOptions[index];
          return ListTile(
            leading: Icon(
              option['icon'],
              color: Theme.of(context).colorScheme.primary,
            ),
            title: Text(option['title']),
            subtitle: Text(option['subtitle']),
            trailing: const Icon(Icons.chevron_right),
            onTap: option['onTap'],
          );
        },
      ),
    );
  }

  // --- Helper: Theme Dialog ---
  void _showThemeDialog(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeProvider);
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Select Theme'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: ThemeMode.values.map((mode) {
            return RadioListTile<ThemeMode>(
              title: Text(_getThemeSubtitle(mode)),
              value: mode,
              groupValue: themeMode,
              onChanged: (value) {
                if (value != null) {
                  ref.read(themeModeProvider.notifier).setTheme(value);
                  Navigator.pop(context);
                }
              },
            );
          }).toList(),
        ),
      ),
    );
  }

  // --- Helper: Font Size Dialog ---
  void _showFontSizeDialog(BuildContext context, WidgetRef ref) {
    final fontSize = ref.watch(fontSizeProvider);
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Select Font Size'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: FontSizeOption.values.map((size) {
            return RadioListTile<FontSizeOption>(
              title: Text(_getFontSizeSubtitle(size)),
              value: size,
              groupValue: fontSize,
              onChanged: (value) {
                if (value != null) {
                  ref.read(fontSizeProvider.notifier).state = value;
                  Navigator.pop(context);
                }
              },
            );
          }).toList(),
        ),
      ),
    );
  }

  // --- Helper: Theme text ---
  String _getThemeSubtitle(ThemeMode mode) {
    switch (mode) {
      case ThemeMode.light:
        return 'Light';
      case ThemeMode.dark:
        return 'Dark';
      case ThemeMode.system:
        return 'System Default';
    }
  }

  // --- Helper: Font size text ---
  String _getFontSizeSubtitle(FontSizeOption size) {
    switch (size) {
      case FontSizeOption.small:
        return 'Small';
      case FontSizeOption.medium:
        return 'Medium';
      case FontSizeOption.large:
        return 'Large';
    }
  }
}
