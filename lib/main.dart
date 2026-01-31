import 'package:flutter/material.dart';
import 'package:misastudio/public/login_page.dart';
import 'package:misastudio/public/splash_page.dart';
import 'package:misastudio/routes.dart';
import 'package:misastudio/theme/app_theme.dart';

ValueNotifier<ThemeMode> themeNotifier = ValueNotifier(ThemeMode.light);

void main() {
  runApp(const HabitlyApp());
}

class HabitlyApp extends StatelessWidget {
  const HabitlyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: themeNotifier,
      builder: (_, ThemeMode currentMode, __) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Misa Studio',

          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: currentMode,

          initialRoute: AppRoutes.splash_page,

          routes: {
            AppRoutes.splash_page: (context) =>  SplashPage(),
            AppRoutes.login_page: (context) => const LoginPage(),
          },
        );
      },
    );
  }
}