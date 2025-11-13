import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTheme {
  static ThemeData lightTheme(BuildContext context) {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: AppColors.seedColor,
      primary: AppColors.seedColor,
      onPrimary: Colors.white,
      brightness: Brightness.light,
      // onSurface: Colors.black,
      onSurfaceVariant: Colors.grey,
      onError: const Color(0xFFEA2A33),
      surfaceContainerHigh: const Color(0xFFFFFFFF),
      surfaceContainerLow: const Color(0xFFECF1F7),
      outline: const Color.fromARGB(255, 220, 226, 234),
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      // scaffoldBackgroundColor: const Color(0xffEDF2FB),
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        foregroundColor: colorScheme.onSurface,
        elevation: 0,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: colorScheme.primary,
          foregroundColor: colorScheme.onPrimary,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
      textTheme: Theme.of(context).textTheme.apply(
        // fontFamily: appFont(context),
        bodyColor: colorScheme.onSurface,
        displayColor: colorScheme.onSurface,
      ),
      // fontFamily: appFont(context),
      dividerTheme: DividerThemeData(color: colorScheme.outline, thickness: 1),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: colorScheme.primary,
        foregroundColor: colorScheme.onPrimary,
      ),
    );
  }

  static ThemeData darkTheme(BuildContext context) {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: AppColors.seedColor,
      brightness: Brightness.dark,
      primary: AppColors.seedColor,
      onPrimary: Colors.white,
      // onSurface: Colors.white,
      onSurfaceVariant: const Color.fromARGB(255, 145, 147, 163),
      // onError: Color(0xffF27A80),
      surfaceContainerHigh: const Color(0xff212330),
      surfaceContainerLow: const Color(0xff303343),
      outline: const Color.fromARGB(255, 59, 62, 78),
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: const Color(0xff171923),
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        foregroundColor: colorScheme.onSurface,
        elevation: 0,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: colorScheme.primary,
          foregroundColor: colorScheme.onPrimary,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
      textTheme: Theme.of(context).textTheme.apply(
        // fontFamily: appFont(context),
        bodyColor: colorScheme.onSurface,
        displayColor: colorScheme.onSurface,
      ),
      // fontFamily: appFont(context),
      dividerTheme: DividerThemeData(color: colorScheme.outline, thickness: 1),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: colorScheme.primary,
        foregroundColor: colorScheme.onPrimary,
      ),
    );
  }
}
