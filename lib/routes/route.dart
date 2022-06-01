import 'dart:js';

import 'package:flutter/material.dart';
import 'package:pocho_project/home/home.dart';
import 'package:pocho_project/splash/splash.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  HomeScreen.routeName: (context) => HomeScreen(),
};
