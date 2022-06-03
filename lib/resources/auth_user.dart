import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class AuthUser {
  // creating the instances of the firebase authentification
  FirebaseAuth _auth = FirebaseAuth.instance;

  // Creating the function which is responsible for the auth related work
  createUser({
    required TextEditingController email,
    required TextEditingController password,
    required TextEditingController bio,
  }) {}
}
