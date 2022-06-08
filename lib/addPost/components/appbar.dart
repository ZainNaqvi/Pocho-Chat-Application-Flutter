import 'package:flutter/material.dart';
import 'package:pocho_project/model/users.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

AppBar customAppBarAddPost(
    UserCreaditials userCreaditials, Function addPost, VoidCallback press) {
  return AppBar(
    actions: [
      Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: GestureDetector(
            onTap: () => addPost(),
            child: Text(
              "Post",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 15.sp,
              ),
            ),
          ),
        ),
      ),
    ],
    backgroundColor: Colors.black,
    centerTitle: false,
    title: Text(
      "Add Post",
      style: TextStyle(fontSize: 15.sp),
    ),
    leading: IconButton(
      icon: Icon(Icons.arrow_back_ios),
      onPressed: press,
    ),
  );
}
