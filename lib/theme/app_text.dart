import 'package:flutter/material.dart';
import 'app_color.dart';

class AppText {

  /// ===== COLORS =====
  static Color textColor(BuildContext context) =>
      Theme.of(context).colorScheme.onSurface;

  static Color mutedText(BuildContext context) =>
      Theme.of(context).colorScheme.onSurface.withOpacity(0.6);


  /// ===== TITLE =====
  static TextStyle title(BuildContext context) {
    return TextStyle(
      fontFamily: 'Urbanist',
      fontSize: 22,
      fontWeight: FontWeight.bold,
      color: textColor(context),
    );
  }

  /// ===== BODY =====
  static TextStyle body(BuildContext context) {
    return TextStyle(
      fontFamily: 'Urbanist',
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: textColor(context),
    );
  }

  /// ===== CAPTION =====
  static TextStyle caption(BuildContext context) {
    return TextStyle(
      fontFamily: 'Urbanist',
      fontSize: 14,
      color: AppColor.grey,
    );
  }

  /// ===== LINK =====
  static TextStyle link(BuildContext context) {
    return TextStyle(
      fontFamily: 'Urbanist',
      fontSize: 14,
      fontWeight: FontWeight.normal,
      color: AppColor.grey,
    );
  }

  /// ===== BUTTON =====
  static TextStyle button(BuildContext context, {required Color color}) {
    return TextStyle(
      fontFamily: 'Urbanist',
      fontSize: 14,
      fontWeight: FontWeight.w300,
      color: color,
    );
  }
}