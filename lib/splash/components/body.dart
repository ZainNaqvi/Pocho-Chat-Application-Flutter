import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'package:pocho_project/login/login_screen.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> with SingleTickerProviderStateMixin {
  // Animation controller
  late AnimationController _animationController;
  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this,
        duration: Duration(
          seconds: 5,
        ));

    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Navigator.pushReplacementNamed(context, LoginScreen.routeName);
      }
      ;
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.asset(
        "assets/images/error.json",
        controller: _animationController,
        onLoaded: (compostion) {
          _animationController.forward();
        },
      ),
    );
  }
}
