import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:pocho_project/login/components/forgotpassword.dart';
import 'package:pocho_project/login/components/form.dart';
import 'package:pocho_project/login/components/header.dart';
import 'package:pocho_project/login/components/orsignin.dart';
import 'package:pocho_project/login/components/signup.dart';

import 'package:pocho_project/widgets/defaultButton.dart';

class Body extends StatelessWidget {
  Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 16.w,
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
              height: 20,
            ),
            // forgot password
            forgotPassword(
              press: () {},
            ),
            //
            // Login button
            SizedBox(
              height: 30,
            ),
            defaultButton(
              text: "Log in",
              press: () {},
            ),
            SizedBox(
              height: 40,
            ),
            // divider and text
            orSignIN(),
            SizedBox(
              height: 41,
            ),
            // dont have an account
            signUp(press: () {}),

            // designed by
          ],
        ),
      ),
    );
  }
}
