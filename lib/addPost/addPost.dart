import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pocho_project/addPost/components/appbar.dart';
import 'package:pocho_project/constants.dart';
import 'package:pocho_project/model/users.dart';
import 'package:pocho_project/providers/userProviders.dart';
import 'package:pocho_project/utilities/imagePicker.dart';
import 'package:provider/provider.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddPostScreen extends StatefulWidget {
  static String routeName = "/addPost";

  @override
  State<AddPostScreen> createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  TextEditingController _feeling = TextEditingController();
  TextEditingController _caption = TextEditingController();

  Uint8List? _file;

  selectImage(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
          title: Text("Create a Post"),
          children: [
            SimpleDialogOption(
              padding: const EdgeInsets.all(20),
              child: Text("Take a Photo"),
              onPressed: () async {
                Navigator.of(context).pop();
                Uint8List file = await pickImage(ImageSource.camera);
                setState(() {
                  _file = file;
                });
              },
            ),
            SimpleDialogOption(
              padding: const EdgeInsets.all(20),
              child: Text("Choice from Gallary."),
              onPressed: () async {
                Navigator.of(context).pop();
                Uint8List file = await pickImage(ImageSource.gallery);
                setState(() {
                  _file = file;
                });
              },
            ),
            SimpleDialogOption(
              padding: const EdgeInsets.all(20),
              child: Text("Cancel"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    _feeling.dispose();
    _caption.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // provider code for gettiing the data from the databsae
    UserCreaditials? userCreaditials =
        Provider.of<UserProviders>(context).getUser;
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: customAddPostAppBar(),
      body: _file == null
          ? Center(
              child: IconButton(
                  icon: Icon(
                    Icons.upload,
                  ),
                  onPressed: () => selectImage(context)),
            )
          : SingleChildScrollView(
              child: SafeArea(
                child: Padding(
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
                            backgroundImage:
                                NetworkImage(userCreaditials.profilePic),
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
                            width: 150.w,
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
            ),
    );
  }
}
