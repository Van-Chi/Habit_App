import 'package:flutter/cupertino.dart';

class LoginController extends ChangeNotifier {
  bool obscureText = true;

  Future loadData() async{
    obscureText=true;
  }
  void setObscureText() {
    obscureText = !obscureText;
    notifyListeners();
  }

  void setEmail(String value){

  }
}
