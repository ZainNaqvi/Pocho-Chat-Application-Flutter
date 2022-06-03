import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pocho_project/signup/components/form.dart';
import 'package:pocho_project/signup/components/header.dart';
import 'package:pocho_project/signup/components/orsignin.dart';
import 'package:pocho_project/signup/components/signup.dart';

class Body extends StatelessWidget {
  Body({Key? key}) : super(key: key);
// get the screen height

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: AlwaysScrollableScrollPhysics(),
      child: SafeArea(
        child: Center(
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: 16.w,
              vertical: 16.h,
            ),
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // header
                headerContent(),

                // form field
                SizedBox(
                  height: 12,
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
                signUp(
                    text:
                        "By signing up , you agree to our Terms, Data\n Policy and Cookies Policy.",
                    press: () {}),

                // designed by
              ],
            ),
          ),
        ),
      ),
    );
  }
}
