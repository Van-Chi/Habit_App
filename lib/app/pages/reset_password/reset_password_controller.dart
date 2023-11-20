import 'package:flutter/foundation.dart';

class ResetPasswordController extends ChangeNotifier{
  String email='';

  void setEmail(String value){
    email=value;
    notifyListeners();
  }
}