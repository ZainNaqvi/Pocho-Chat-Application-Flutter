import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Row orSignIN() {
  return Row(
    children: [
      Expanded(child: Divider()),
      SizedBox(
        width: 30,
      ),
      Text(
        "OR",
        style: TextStyle(
          color: Colors.white,
          fontSize: 10.sp,
        ),
      ),
      SizedBox(
        width: 30,
      ),
      Expanded(child: Divider()),
    ],
  );
}
