import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

GestureDetector forgotPassword({required VoidCallback press}) {
  return GestureDetector(
    onTap: press,
    child: Align(
      alignment: Alignment.topRight,
      child: Text(
        "Forgot password?",
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.blue,
          fontSize: 10.sp,
        ),
      ),
    ),
  );
}
