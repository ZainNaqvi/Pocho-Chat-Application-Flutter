import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pocho_project/login/components/customInputDecoration.dart';
import 'package:pocho_project/login/components/eyeController.dart';
import 'package:pocho_project/login/components/forgotpassword.dart';
import 'package:pocho_project/login/components/form.dart';
import 'package:pocho_project/login/components/header.dart';
import 'package:pocho_project/login/components/signupButton.dart';
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
            Row(
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
            ),
            SizedBox(
              height: 41,
            ),
            // dont have an account
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't have an account?",
                  style: TextStyle(
                    fontSize: 10.sp,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(
                  width: 3,
                ),
                // sign up
                signupButton(press: () {}),
              ],
            ),
            // designed by
          ],
        ),
      ),
    );
  }
}
