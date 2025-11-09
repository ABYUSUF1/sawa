import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:device_preview/device_preview.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'core/router/app_router.dart';
import 'core/theme/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Supabase
  await Supabase.initialize(
    url: 'YOUR_SUPABASE_URL',
    anonKey: 'YOUR_SUPABASE_ANON_KEY',
  );

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DevicePreview(
      enabled: false, // set true later for testing
      builder: (context) => MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'SAWA',
        theme: AppTheme.lightTheme(context),
        darkTheme: AppTheme.lightTheme(context),
        themeMode: ThemeMode.system,
        routerConfig: appRouter,
      ),
    );
  }
}
