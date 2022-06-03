import 'package:flutter/material.dart';
import 'package:pocho_project/login/components/body.dart';
import 'package:pocho_project/widgets/customAppBar.dart';
import 'package:pocho_project/widgets/customNavigation.dart';

class LoginScreen extends StatelessWidget {
  static String routeName = '/loginScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
          color: Colors.transparent,
          press: () {},
          text: "Login",
          context: context),
      body: Body(),
      bottomNavigationBar: customNavigation(),
    );
  }
}
