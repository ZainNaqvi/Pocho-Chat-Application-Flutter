import 'package:flutter/material.dart';
import 'package:pocho_project/resources/auth_user.dart';

import 'package:pocho_project/signup/components/customInputDecoration.dart';
import 'package:pocho_project/signup/components/eyeController.dart';

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
  selectedImage() {}
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          imagePickerUser(
            press: selectedImage,
          ),
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
              await AuthUser().createUser(
                email: _emailController.text,
                password: _passwordController.text,
                bio: _userBioController.text,
                fullName: _fullNameController.text,
                userName: _userNameController.text,
              );
            },
          ),
        ],
      ),
    );
  }
}
