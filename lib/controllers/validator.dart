import 'package:flutter/material.dart';
import 'package:misastudio/theme/app_color.dart';
import 'package:misastudio/theme/app_text.dart';

class LoginValidator {

  static bool validateGender(String gender, BuildContext context) {
    if (gender.isEmpty) {
      _showError(context, 'Gender must be selected');
      return false;
    }
    return true;
  }


static bool validatePhoneNumber(String phoneNumber, BuildContext context) {
    if (phoneNumber.isEmpty) {
      _showError(context, 'Phone Number cannot be empty');
      return false;
    }
    return true;
  }

  static bool validateEmail(String email, BuildContext context) {
    if (email.isEmpty) {
      _showError(context, 'Email cannot be empty');
      return false;
    }
    if (!email.contains('@') ) {
      _showError(context, 'Email format is incorrect');
      return false;
    }
    return true;
  }

  static bool validatePassword(String password, BuildContext context) {
    if (password.isEmpty) {
      _showError(context, 'Password cannot be empty');
      return false;
    }
    if (password.length < 8) {
        _showError(context, 'Password must contain 8 characters');
      return false;
    }
    return true;
  }

  static bool validateConfirmPassword(
      String password, String confirmPassword, BuildContext context) {
    if (confirmPassword.isEmpty) {
      _showError(context, 'Confirm password cannot be empty');
      return false;
    }
    if (password != confirmPassword) {
      _showError(context, 'Passwords do not match');
      return false;
    }
    return true;
  }


  static bool validateFullName(String fullName, BuildContext context) {
    final parts = fullName.trim().split(RegExp(r'\s+'));
    if (fullName.isEmpty) {
      _showError(context, 'Full name cannot be empty');
      return false;
    }
    if (parts.length < 2) {
      _showError(context, 'Full name must contain at least 2 word');
      return false;
    }
    return true;
  }

  static void _showError(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: AppText.button(context, color: AppColor.white)
        ),
        backgroundColor: AppColor.black,
        duration: const Duration(seconds: 4),
      ),
    );
  }
}