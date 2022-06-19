import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pocho_project/constants.dart';
import 'package:pocho_project/model/users.dart';

class PostUpload extends StatelessWidget {
  const PostUpload({
    Key? key,
    required bool isloading,
    required this.userCreaditials,
    required this.size,
    required Uint8List? file,
    required TextEditingController feeling,
    required TextEditingController caption,
  })  : _isloading = isloading,
        _file = file,
        _feeling = feeling,
        _caption = caption,
        super(key: key);

  final bool _isloading;
  final UserCreaditials? userCreaditials;
  final Size size;
  final Uint8List? _file;
  final TextEditingController _feeling;
  final TextEditingController _caption;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Column(
            children: [
              _isloading
                  ? LinearProgressIndicator(
                      color: Colors.white,
                    )
                  : Padding(padding: EdgeInsets.only(top: 0)),
              const Divider(),
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
                    backgroundImage: NetworkImage(
                      userCreaditials!.profilePic,
                    ),
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
                          userCreaditials!.fullName.toUpperCase(),
                          style: TextStyle(
                            fontSize: 20.sp,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          userCreaditials!.bio,
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
                height: MediaQuery.of(context).size.height * 0.6.h,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: MemoryImage(_file!),
                    fit: BoxFit.fill,
                    alignment: FractionalOffset.topCenter,
                  ),
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 10.w,
                  ),
                  SizedBox(
                    width: 250.w,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        TextField(
                          controller: _feeling,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Feeling....",
                          ),
                        ),
                        TextField(
                          controller: _caption,
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
        ),
      ),
    );
  }
}
