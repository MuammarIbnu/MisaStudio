import 'package:flutter/material.dart';
import 'package:misastudio/public/splash_page.dart';
import 'package:misastudio/routes.dart';
import 'package:misastudio/theme/app_theme.dart';
import 'package:misastudio/roles/user/user_login_page.dart';
import 'package:misastudio/roles/user/user_register_page.dart';
import 'package:sizer/sizer.dart';

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
      builder: (_, ThemeMode currentMode,_) {
        return Sizer(
          builder: (context, orientation, deviceType) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Misa Studio',
              theme: AppTheme.lightTheme,
              darkTheme: AppTheme.darkTheme,
              themeMode: currentMode,

              initialRoute: AppRoutes.splash_page,

              routes: {
                /// PUBLIC
                AppRoutes.splash_page: (context) => const SplashPage(),

                /// USER
                AppRoutes.user_login_page: (context) => const LoginUserPage(),
                AppRoutes.user_register_page: (
                    context) => const RegisterUserPage(),

                /// ARCHITECTURE
              },
            );
          },
        );
      },
    );
  }
}