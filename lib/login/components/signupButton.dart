import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget signupButton({required VoidCallback press}) {
  return InkWell(
    onTap: press,
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
