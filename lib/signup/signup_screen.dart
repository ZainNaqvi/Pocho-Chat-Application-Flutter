import 'package:flutter/material.dart';
import 'package:pocho_project/signup/components/body.dart';
import 'package:pocho_project/widgets/customAppBar.dart';
import 'package:pocho_project/widgets/customNavigation.dart';

class SignUpScreen extends StatelessWidget {
  static String routeName = '/signupScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        text: "Signup Screen",
        context: context,
      ),
      body: Body(),
      bottomNavigationBar: customNavigation(),
    );
  }
}
