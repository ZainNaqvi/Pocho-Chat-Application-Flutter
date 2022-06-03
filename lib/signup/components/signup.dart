import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Row signUp({required String text, required VoidCallback press}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        text,
        textAlign: TextAlign.center,
        maxLines: 2,
        style: TextStyle(
          fontSize: 10.sp,
          color: Colors.grey,
          height: 1.4,
        ),
      ),

      // sign up
    ],
  );
}
