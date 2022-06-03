import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Column headerContent() {
  return Column(
    children: [
      Text(
        "P O C H O ",
        style: TextStyle(
          fontSize: 30.sp,
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
