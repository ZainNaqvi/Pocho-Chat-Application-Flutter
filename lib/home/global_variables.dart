import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:pocho_project/addPost/addPost.dart';
import 'package:pocho_project/feedScreen/feedScreen.dart';
import 'package:pocho_project/profile/profile.dart';
import 'package:pocho_project/searchScreen/search.dart';

List<Widget> items = [
  FeedScreen(),
  SearchScreen(),
  AddPostScreen(),
  Text("Notification"),
  ProfileScreen(
    uid: FirebaseAuth.instance.currentUser!.uid,
  ),
];
