import 'package:flutter/material.dart';
import 'package:pocho_project/addPost/components/appbar.dart';
import 'package:pocho_project/addPost/components/body.dart';

class AddPost extends StatelessWidget {
  const AddPost({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAddPostAppBar(),
      body: Body(),
    );
  }
}
