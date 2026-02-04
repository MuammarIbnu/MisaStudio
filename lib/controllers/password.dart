import 'package:flutter/material.dart';

/// COTROLLER OBSECURE PASSWORD
class PasswordController extends ChangeNotifier {
  bool _obscure = true;

  bool get obscure => _obscure;

  void toggle() {
    _obscure = !_obscure;
    notifyListeners();
  }
}