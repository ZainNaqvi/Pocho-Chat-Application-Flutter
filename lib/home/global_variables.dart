import 'package:flutter/cupertino.dart';
import 'package:pocho_project/addPost/addPost.dart';
import 'package:pocho_project/feedScreen/feedScreen.dart';
import 'package:pocho_project/searchScreen/search.dart';

List<Widget> items = [
  FeedScreen(),
  SearchScreen(),
  AddPostScreen(),
  Text("notif"),
  Text("personal"),
];
