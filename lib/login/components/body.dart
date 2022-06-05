import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pocho_project/login/components/form.dart';
import 'package:pocho_project/login/components/header.dart';
import 'package:pocho_project/login/components/orsignin.dart';
import 'package:pocho_project/login/components/signup.dart';
import 'package:pocho_project/signup/components/signup.dart';
import 'package:pocho_project/signup/signup_screen.dart';

class Body extends StatelessWidget {
  Body({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      physics: AlwaysScrollableScrollPhysics(),
      child: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 16.w,
            vertical: size.height * 0.04.h,
          ),
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // header
              headerContent(),

              // form field
              SizedBox(
                height: 39,
              ),
              formField(),

              SizedBox(
                height: 40,
              ),
              // divider and text
              orSignIN(),
              SizedBox(
                height: 41,
              ),
              // dont have an account
              Signup(),
              // designed by
            ],
          ),
        ),
      ),
    );
  }
}
