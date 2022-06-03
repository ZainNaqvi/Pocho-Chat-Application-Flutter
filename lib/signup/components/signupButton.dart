import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

GestureDetector signupButton({required VoidCallback press}) {
  return GestureDetector(
    onTap: () {},
    child: Text(
      "Sign up",
      style: TextStyle(
        fontSize: 10.sp,
        color: Colors.blue,
        fontWeight: FontWeight.w500,
      ),
    ),
  );
}
