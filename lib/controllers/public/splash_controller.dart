import 'package:flutter/material.dart';
import 'package:misastudio/routes.dart';

class SplashController {
  void login(BuildContext context, String role) {

    if (role == 'user') {
      Navigator.pushNamed(context, AppRoutes.user_login_page);
    } else if (role == 'architecture') {
      Navigator.pushNamed(context, AppRoutes.user_login_page);
    }
  }
}
