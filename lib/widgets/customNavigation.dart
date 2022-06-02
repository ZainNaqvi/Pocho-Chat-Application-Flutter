import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Container customNavigation() {
  return Container(
    height: 60.h,
    child: Column(
      children: [
        Divider(),
        SizedBox(
          height: 12.h,
        ),
        Text(
          "Designed & Developed By Zain Haider Naqvi",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 10.sp,
            color: Colors.grey,
          ),
        ),
      ],
    ),
  );
}
