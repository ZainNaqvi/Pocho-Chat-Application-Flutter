import 'package:flutter/material.dart';
import 'package:pocho_project/home/components/body.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = "/homeScreen";

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Body(),
    );
  }
}
