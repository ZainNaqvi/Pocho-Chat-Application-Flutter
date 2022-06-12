import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pocho_project/addPost/components/postUpload.dart';
import 'package:pocho_project/model/users.dart';
import 'package:pocho_project/providers/userProviders.dart';
import 'package:pocho_project/resources/firestoreMethods.dart';
import 'package:pocho_project/utilities/imagePicker.dart';
import 'package:pocho_project/widgets/customSnakeBar.dart';
import 'package:provider/provider.dart';
import 'components/appbar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddPostScreen extends StatefulWidget {
  static String routeName = "/addPost";

  @override
  State<AddPostScreen> createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  TextEditingController _feeling = TextEditingController();
  TextEditingController _caption = TextEditingController();
  bool _isloading = false;
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

// for adding post
  void addPost({
    required String uid,
    required String userName,
    required String fullName,
    required String profileImage,
  }) async {
    setState(() {
      _isloading = true;
    });
    try {
      String res = await FirestoreMethods().uploadPost(
        file: _file!,
        description: _caption.text,
        uid: uid,
        userName: userName,
        profileImage: profileImage,
        fullName: fullName,
      );
      if (res == "success") {
        setState(() {
          _isloading = false;
        });
        showSnakeBar("The post successfully posted.", context);
        clearImage();
      } else {
        setState(() {
          _isloading = false;
        });
        showSnakeBar(res, context);
      }
    } catch (e) {
      showSnakeBar(e.toString(), context);
    }
  }

  void clearImage() {
    setState(() {
      _file = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    // provider code for gettiing the data from the databsae
    UserCreaditials? userCreaditials =
        Provider.of<UserProviders>(context).getUser;
    // media query

    final size = MediaQuery.of(context).size;
    // // // // // //
    return Scaffold(
      appBar: customAppBarAddPost(
        userCreaditials,
        () {
          addPost(
            uid: userCreaditials.uid,
            profileImage: userCreaditials.profilePic,
            userName: userCreaditials.userName,
            fullName: userCreaditials.fullName,
          );
        },
        () => clearImage(),
      ),
      body: _file == null
          ? Container(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.upload,
                    ),
                    onPressed: () => selectImage(context),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Upload Image from your gallary or take a image using the phone camera and post it to the social media of P O C H O ",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            )
          : PostUpload(
              isloading: _isloading,
              userCreaditials: userCreaditials,
              size: size,
              file: _file,
              feeling: _feeling,
              caption: _caption,
            ),
    );
  }
}
