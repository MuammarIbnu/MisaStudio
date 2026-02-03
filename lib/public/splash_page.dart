import 'package:flutter/material.dart';
import '../theme/app_color.dart';
import '../theme/app_text.dart';
import 'package:misastudio/widgets/buttons/role_login_button.dart';
import 'package:misastudio/controllers/public/splash_controller.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final SplashController controller = SplashController();

    return Scaffold(
      backgroundColor: isDark
          ? AppColor.darkBackground
          : AppColor.lightBackground,

      body: Column(
        children: [

          /// ===== TOP SECTION (LOGO) =====
          Expanded(
            flex: 10,
            child: Center(
              child: Image.asset(
                'assets/images/logo misa studio.png',
                width: 280,
              ),
            ),
          ),

          /// ===== BOTTOM CARD =====
          Expanded(
            flex: 6,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(32),
              decoration: BoxDecoration(
                color: AppColor.black26,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(32),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Find Your Dream House',
                    style: AppText.body(context).copyWith(
                      fontStyle: FontStyle.italic,
                      fontSize: 22,
                      shadows: [
                        Shadow(
                          color: AppColor.black26,
                          blurRadius: 14,
                          offset: Offset(4, 4),
                        )
                      ],
                    ),
                  ),

                  const SizedBox(height: 24),

                  /// ===== ROW BUTTONS =====
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      /// BUTTON LOGIN ARCHITECTURE
                      Expanded(
                        child: RoleLoginButton(
                          label: 'Architecture',
                          icon: Icons.architecture,
                          onPressed: () => controller.login(context, 'architecture'),
                        ),
                      ),

                      const SizedBox(width: 28),

                      /// BUTTON LOGIN USER
                      Expanded(
                        child: RoleLoginButton(
                          label: 'User',
                          icon: Icons.person,
                          onPressed: () => controller.login(context, 'user'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}