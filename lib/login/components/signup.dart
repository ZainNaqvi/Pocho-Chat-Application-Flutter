import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pocho_project/login/components/signupButton.dart';
import 'package:pocho_project/signup/signup_screen.dart';

class Signup extends StatelessWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
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
        signupButton(
          press: () {
            Navigator.pushNamed(context, SignUpScreen.routeName);
          },
        ),
      ],
    );
  }
}
