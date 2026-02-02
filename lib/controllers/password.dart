import 'package:flutter/material.dart';

class PasswordController extends ChangeNotifier {
  bool _obscure = true;

  bool get obscure => _obscure;

  void toggle() {
    _obscure = !_obscure;
    notifyListeners();
  }
}