import 'package:flutter/material.dart';

class Navigasi {
  void push(BuildContext context, String route) {
    Navigator.pushNamed(context, route);
  }
  void replacemen (BuildContext context, String route) {
    Navigator.pushReplacementNamed(context, route);
  }
  void pop (BuildContext context, String route) {
    Navigator.popAndPushNamed(context, route);
  }
}