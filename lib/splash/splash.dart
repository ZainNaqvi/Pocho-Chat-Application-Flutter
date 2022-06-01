import 'package:flutter/material.dart';
import 'package:pocho_project/splash/components/body.dart';

class SplashScreen extends StatelessWidget {
  static String routeName = '/splashScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}
