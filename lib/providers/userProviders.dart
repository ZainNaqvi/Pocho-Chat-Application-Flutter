import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:pocho_project/model/users.dart';
import 'package:pocho_project/resources/auth_user.dart';

class UserProviders extends ChangeNotifier {
  UserCreaditials? _users;
  final AuthUser _auth = AuthUser();
  // getter of the _users
  UserCreaditials get getUser => _users!;
  Future<void> refreshUser() async {
    UserCreaditials userCreaditials = await _auth.getUserDetails();
    _users = userCreaditials;
    print(_users!.userName);
    notifyListeners();
  }
}
