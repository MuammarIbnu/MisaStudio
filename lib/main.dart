import 'package:flutter/material.dart';
import 'package:misastudio/public/splash_page.dart';
import 'package:misastudio/roles/user/user_dashboard_page.dart';
import 'package:misastudio/routes.dart';
import 'package:misastudio/theme/app_theme.dart';
import 'package:misastudio/roles/user/user_login_page.dart';
import 'package:misastudio/roles/user/user_register_page.dart';
import 'package:sizer/sizer.dart';

ValueNotifier<ThemeMode> themeNotifier = ValueNotifier(ThemeMode.light);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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

              initialRoute: AppRoutes.splashPage,

              routes: {
                /// PUBLIC
                AppRoutes.splashPage: (context) => const SplashPage(),

                /// USER
                AppRoutes.userLoginPage: (context) => const LoginUserPage(),
                AppRoutes.userRegisterPage: (context) => const RegisterUserPage(),
                AppRoutes.userDashboardPage: (context) => const DashboardUserPage(),
                /// ARCHITECTURE
              },
            );
          },
        );
      },
    );
  }
}