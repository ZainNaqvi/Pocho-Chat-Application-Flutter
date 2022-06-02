import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

GestureDetector defaultButton(
    {required String text, required VoidCallback press}) {
  return GestureDetector(
    onTap: press,
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: Colors.blue,
      ),
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 12.h),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    ),
  );
}
