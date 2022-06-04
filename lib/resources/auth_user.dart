import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pocho_project/utilities/storage_methods.dart';
// import 'package:flutter/material.dart';

class AuthUser {
  // creating the instances of the firebase authentification
  final FirebaseAuth _auth = FirebaseAuth.instance;
// creating the instances of the firebase firestore cloud database
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  // Creating the function which is responsible for the auth related work

//

  Future<String> createUser({
    required String email,
    required String password,
    required String bio,
    required String fullName,
    required String userName,
    required Uint8List profilePic,
  }) async {
    String res = 'Running state....';
    try {
      if (email.isNotEmpty ||
          password.isNotEmpty ||
          bio.isNotEmpty ||
          userName.isNotEmpty ||
          fullName.isNotEmpty) {
        // validation for authentication firebase authentification tab

        UserCredential creaditials = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);
        // printing the user uid as we know the user id could'nt null
        print(creaditials.user!.uid);
        // for storing the data like username, userpic and userphone number etc etc we have to call cloud database
        String photoUrl = await StorageMethods()
            .uploadImageToStorage("ProfilePics", profilePic, false);

        await _firebaseFirestore
            .collection("users")
            .doc(creaditials.user!.uid)
            .set({
          "fullName": fullName,
          "userName": userName,
          "bio": bio,
          "uid": creaditials.user!.uid,
          "followers": [],
          "following": [],
          "photoURL": photoUrl,
        });
      }
      res = "success";
    } catch (err) {
      res = err.toString();
    }
    return res;
  }
}
// on FirebaseAuthException catch (err) {
//       if (err.code == "invalid-email") {
//         res = "The email is badly formated0";
//       } else if (err.code == "weak-password") {
//         res = "The password is weak at least 6 character";
//       }
//     } 