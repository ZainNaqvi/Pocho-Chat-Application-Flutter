import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pocho_project/constants.dart';
import 'package:pocho_project/model/users.dart';
import 'package:pocho_project/providers/userProviders.dart';
import 'package:pocho_project/utilities/imagePicker.dart';
import 'package:provider/provider.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    // provider code for gettiing the data from the databsae
    UserCreaditials? userCreaditials =
        Provider.of<UserProviders>(context).getUser;
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Column(
        children: [
          SizedBox(
            height: 10.h,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                key: UniqueKey(),
                backgroundColor: darkColor,
                radius: 30,
                backgroundImage: NetworkImage(userCreaditials.profilePic),
              ),
              SizedBox(
                width: 10.w,
              ),
              SizedBox(
                width: size.width * 0.60,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      userCreaditials.fullName.toUpperCase(),
                      style: TextStyle(
                        fontSize: 20.sp,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      userCreaditials.bio,
                      style: TextStyle(
                        fontSize: 15.sp,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              //  mage selected post
            ],
          ),
          SizedBox(
            height: 20.h,
          ),
          Container(
            width: double.infinity,
            child: Image.network(
              "https://cdn.motor1.com/images/mgl/m7oYq/s3/2021-mercedes-benz-s-class.jpg",
              key: UniqueKey(),
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 10.w,
              ),
              SizedBox(
                width: 150.w,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Feeling....",
                      ),
                    ),
                    TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Enter the caption...",
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
