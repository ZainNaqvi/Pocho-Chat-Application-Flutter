import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pocho_project/login/components/signupButton.dart';

Row signUp({required VoidCallback press}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        "Don't have an account?",
        style: TextStyle(
          fontSize: 10.sp,
          color: Colors.grey,
        ),
      ),
      SizedBox(
        width: 3,
      ),
      // sign up
      signupButton(press: press),
    ],
  );
}
