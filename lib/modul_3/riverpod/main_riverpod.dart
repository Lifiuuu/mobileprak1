import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Import core files
import 'core/constants/app_constants.dart';
import 'core/theme/app_theme.dart';

// Import feature files
import 'features/dashboard/presentation/pages/dashboard_page.dart';
import 'features/dashboard/presentation/providers/dashboard_providers.dart';

void main() {
  runApp(
    // ProviderScope wajib ada di root aplikasi agar seluruh widget
    // di bawahnya bisa membaca provider dari Riverpod.
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

// Gunakan ConsumerWidget agar MyApp bisa membaca state provider (khususnya untuk Tema)
class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Membaca state tema dari themeModeProvider (false = light, true = dark)
    final isDarkMode = ref.watch(themeModeProvider);

    return MaterialApp(
      title: AppConstants.appName,
      debugShowCheckedModeBanner: false,
      
      // Menerapkan konfigurasi tema dari AppTheme yang ada di folder core
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      
      // Mengatur tema aktif berdasarkan state dari provider
      themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,
      
      // Menjadikan DashboardPage dari folder features sebagai halaman utama
      home: const DashboardPage(),
    );
  }
}