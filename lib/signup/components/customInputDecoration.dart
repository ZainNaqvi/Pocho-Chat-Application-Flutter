import 'package:flutter/material.dart';
import 'package:pocho_project/login/components/suffixIcon.dart';
import 'package:pocho_project/widgets/customOutlineBorder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

InputDecoration customInputDecoration({
  required String text,
  required IconData icon,
  required VoidCallback press,
}) {
  return InputDecoration(
    floatingLabelBehavior: FloatingLabelBehavior.always,
    contentPadding: EdgeInsets.symmetric(
      horizontal: 15.w,
    ),
    hintText: text,
    suffixIcon: GestureDetector(
      onTap: press,
      child: suffixicon(
        icon: icon,
      ),
    ),
    filled: true,
    enabledBorder: outlineCustomBorder(),
    border: outlineCustomBorder(),
    focusedBorder: outlineCustomBorder(),
  );
}
