import 'package:flutter/material.dart';
import 'package:pocho_project/login/components/body.dart';

class LoginScreen extends StatelessWidget {
  static String routeName = '/loginScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}
