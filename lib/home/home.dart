import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = "/homeScreen";

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Welcome to the home screen."),
      ),
    );
  }
}
