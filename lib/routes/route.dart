import 'package:flutter/material.dart';
import 'package:pocho_project/home/home.dart';

import 'package:pocho_project/login/login_screen.dart';
import 'package:pocho_project/signup/signup_screen.dart';
import 'package:pocho_project/splash/splash.dart';
import 'package:provider/provider.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  LoginScreen.routeName: (context) => LoginScreen(),
  SignUpScreen.routeName: (context) => SignUpScreen(),
  HomeScreen.routeName: (context) => HomeScreen(),
};
