import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Column headerContent() {
  return Column(
    children: [
      Text(
        'Welcome Back\n P O C H O',
        textAlign: TextAlign.center,
        style: TextStyle(
          height: 1.4,
          fontWeight: FontWeight.bold,
          fontSize: 35.sp,
        ),
      ),
      SizedBox(height: 5),
      Text(
        "Jo Dil Kare Pocho ",
        style: TextStyle(
          fontSize: 10.sp,
          color: Colors.grey,
        ),
      ),
      SizedBox(
        height: 25,
      ),
      // login welcome back

      SizedBox(
        height: 10,
      ),
      Text(
        'Signin with your email and password or \ncontinue with social media.',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 14.sp, color: Colors.grey),
      ),
    ],
  );
}
