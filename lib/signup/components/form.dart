import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pocho_project/constants.dart';
import 'package:pocho_project/resources/auth_user.dart';

import 'package:pocho_project/signup/components/customInputDecoration.dart';
import 'package:pocho_project/signup/components/eyeController.dart';
import 'package:pocho_project/utilities/imagePicker.dart';

import 'package:pocho_project/widgets/defaultButton.dart';
import 'package:pocho_project/widgets/imagepicker.dart';

class formField extends StatefulWidget {
  formField({
    Key? key,
  }) : super(key: key);

  @override
  State<formField> createState() => _formFieldState();
}

class _formFieldState extends State<formField> {
  final _formKey = GlobalKey<FormState>();
  final obScure _obscure = obScure();
  // creating the text editing controller in for the authertification method of the firebase

  TextEditingController _emailController = TextEditingController();
  TextEditingController _fullNameController = TextEditingController();
  TextEditingController _userNameController = TextEditingController();
  TextEditingController _userBioController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
//
  Uint8List? _imageURL;
  @override
  void dispose() {
    _emailController.dispose();
    _fullNameController.dispose();
    _userNameController.dispose();
    _userBioController.dispose();
    _passwordController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

// for selecting the image process here
  selectedImage() async {
    Uint8List imageURL = await imagePicker(ImageSource.gallery);
    setState(() {
      _imageURL = imageURL;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          // image code
          InkWell(
            borderRadius: BorderRadius.circular(50),
            onTap: () => selectedImage(),
            child: Stack(
              overflow: Overflow.visible,
              children: [
                Container(
                  child: _imageURL != null
                      ? CircleAvatar(
                          key: UniqueKey(),
                          backgroundImage: MemoryImage(
                            _imageURL!,
                          ),
                          backgroundColor: Colors.white.withOpacity(0.13),
                          radius: 50,
                        )
                      : CircleAvatar(
                          key: UniqueKey(),
                          backgroundImage: NetworkImage(
                            "https://www.kindpng.com/picc/m/21-214439_free-high-quality-person-icon-default-profile-picture.png",
                          ),
                          backgroundColor: Colors.white.withOpacity(0.13),
                          radius: 50,
                        ),
                ),
                Positioned(
                  bottom: -5,
                  right: -3,
                  child: Container(
                    padding: EdgeInsets.all(9),
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: darkColor,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: SvgPicture.asset(
                      "assets/icons/camera.svg",
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          // end of teh imamge
          SizedBox(
            height: 12,
          ),
          // email field here....
          TextFormField(
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            decoration: customInputDecoration(
              icon: Icons.email_outlined,
              press: () {},
              text: "Email",
            ),
          ),
          // password field here....
          SizedBox(
            height: 10,
          ),
          TextFormField(
            controller: _fullNameController,
            keyboardType: TextInputType.text,
            decoration: customInputDecoration(
              icon: Icons.person_outline_outlined,
              press: () {},
              text: "Full Name",
            ),
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            controller: _userNameController,
            keyboardType: TextInputType.text,
            decoration: customInputDecoration(
              icon: Icons.person_outline_outlined,
              press: () {},
              text: "Username",
            ),
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            controller: _userBioController,
            keyboardType: TextInputType.text,
            decoration: customInputDecoration(
              icon: Icons.info_outline,
              press: () {},
              text: "Bio",
            ),
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            controller: _passwordController,
            keyboardType: TextInputType.text,
            decoration: customInputDecoration(
              icon: Icons.remove_red_eye_outlined,
              press: () {
                _obscure.updateIsObscure();
                setState(() {});
                print(_obscure.isObscure);
              },
              text: "Password",
            ),
            obscureText: _obscure.isObscure,
          ),

          //
          // Login button
          SizedBox(
            height: 20,
          ),
          defaultButton(
            text: "Sign up",
            press: () async {
              String res = await AuthUser().createUser(
                email: _emailController.text,
                password: _passwordController.text,
                // profilePic: _imageURL!,
                bio: _userBioController.text,
                fullName: _fullNameController.text,
                userName: _userNameController.text,
              );
              print(res);
            },
          ),
        ],
      ),
    );
  }
}
