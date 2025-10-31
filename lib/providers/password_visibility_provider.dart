import 'package:flutter/material.dart';

class PasswordVisibilityProvider extends ChangeNotifier {
  bool _isObscureText = true;

  bool get isObscureText => _isObscureText;

  void toggleVisibility() {
    _isObscureText = !_isObscureText;
    notifyListeners();
  }
}
