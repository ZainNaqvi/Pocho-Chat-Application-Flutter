import 'package:flutter/cupertino.dart';

class obScure extends ChangeNotifier {
  // creating the variable here..
  bool isObscure = true;
  // update isObscure

  void updateIsObscure() {
    isObscure = !isObscure;
  }
}
