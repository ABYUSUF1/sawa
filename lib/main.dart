import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'core/providers/theme_providers.dart';
import 'core/router/app_router.dart';
import 'core/theme/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //* Note: I used publishable key instead of anon Key
  // Supabase doc say that prefer to use publishable key
  await Supabase.initialize(
    url: "https://aleoetcdorqmmmadfypg.supabase.co",
    anonKey: "sb_publishable_SWKfvr60UOR9S6-zun9yXQ_sHwQXT4V",
  );

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeProvider);

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'SAWA',
      theme: AppTheme.lightTheme(context),
      darkTheme: AppTheme.darkTheme(context),
      themeMode: themeMode,
      routerConfig: appRouter,
    );
  }
}
