import 'dart:collection';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pocho_project/constants.dart';
import 'package:pocho_project/home/home.dart';
import 'package:pocho_project/routes/route.dart';
import 'package:pocho_project/splash/splash.dart';

void main() async {
  // initializing the firebase firestore
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "AIzaSyB6dcXHX0umJAvPEToSwfyQgYzaozi8V0A",
        appId: "1:259485677318:web:c1809b0492c18760151087",
        messagingSenderId: "259485677318",
        projectId: "instagram-58391",
        storageBucket: "instagram-58391.appspot.com",
      ),
    );
  } else {
    await Firebase.initializeApp();
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: SplashScreen.routeName,
      routes: routes,
      home: SplashScreen(),
    );
  }
}
