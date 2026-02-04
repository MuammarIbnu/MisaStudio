import 'package:flutter/material.dart';

class Navigasi {

  /// COTROLLER NAVIGASI PUSH
  void push(BuildContext context, String route) {
    Navigator.pushNamed(context, route);
  }
  /// COTROLLER NAVIGASI PUSHREPLACEMENT
  void replacemen (BuildContext context, String route) {
    Navigator.pushReplacementNamed(context, route);
  }
  /// COTROLLER NAVIGASI POP
  void pop (BuildContext context, String route) {
    Navigator.popAndPushNamed(context, route);
  }
  /// COTROLLER NAVIGASI REMOVE UNTIL
  void removeUntil (BuildContext context, String route) {
    Navigator.pushNamedAndRemoveUntil(
      context, route, (Route<dynamic> r) => false, // => HAPUS SEMUA PAGE SEBELUMNYA
    );
  }
}