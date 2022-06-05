import 'package:flutter/cupertino.dart';
import 'package:pocho_project/model/users.dart';

class UserProvider extends ChangeNotifier {
  // creating the instances of the user class here...
  UserCreaditials? _userCreaditials;
  // creating the getter for this _usercreaditials
  UserCreaditials get getUser => _userCreaditials!;
  // for refreshing the user here...
  Future<void> refreshUser() async {}
}
