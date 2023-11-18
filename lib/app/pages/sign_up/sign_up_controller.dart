import 'package:flutter/material.dart';

class SignUpController extends ChangeNotifier {
  bool obscureText = true;
  bool keepCheck = false;
  bool keepEmail = false;

  void loadData() {
    obscureText = true;
    keepCheck = false;
    keepEmail = false;
  }

  void setObscureText() {
    obscureText = !obscureText;
    notifyListeners();
  }

  void setKeepCheck() {
    keepCheck = !keepCheck;
    notifyListeners();
  }

  void setKeepEmail() {
    keepEmail = !keepEmail;
    notifyListeners();
  }
}
