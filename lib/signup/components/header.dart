import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Column headerContent() {
  return Column(
    children: [
      Text(
        "Complete Profile",
        textAlign: TextAlign.center,
        maxLines: 1,
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
    ],
  );
}
