import 'package:flutter/material.dart';
import '../routes.dart';
import '../theme/app_color.dart';
import '../theme/app_text.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

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
                          color: AppColor.orangeaccent.withOpacity(0.9),
                          blurRadius: 14,
                          offset: Offset(4, 4),
                        )
                      ]
                    ),
                  ),

                  const SizedBox(height: 24),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(width: 10),

                      /// BUTTON LOGIN USER
                      Expanded(
                        child: InkWell(
                          borderRadius: BorderRadius.circular(12),
                          onTap: () {
                            // Navigator.pushNamed(context,
                            //   AppRoutes.login_page,
                            // );
                          },
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                height: 56,
                                decoration: BoxDecoration(
                                  color: AppColor.primary,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: const Center(
                                  child: Icon(
                                      Icons.architecture_outlined,
                                      color: AppColor.orangeaccent,
                                    ),
                                  ),
                              ),
                              const SizedBox(height: 6),
                              const Text('Architecture'),
                            ],
                          ),
                        ),
                      ),

                      const SizedBox(width: 28),

                      /// BUTTON LOGIN USER
                      Expanded(
                        child: InkWell(
                          borderRadius: BorderRadius.circular(12),
                          onTap: () {
                            Navigator.pushNamed(context,
                              AppRoutes.login_page,
                            );
                          },
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                height: 56,
                                decoration: BoxDecoration(
                                  color: AppColor.primary,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: const Center(
                                  child: Icon(
                                    Icons.person,
                                    color: AppColor.orangeaccent,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 6),
                              const Text('User'),
                            ],
                          ),
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