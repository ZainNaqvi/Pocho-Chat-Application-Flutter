import 'package:flutter/material.dart';

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
  TextEditingController _passwordController = TextEditingController();
//
  @override
  void dispose() {
    _emailController.dispose();
    _fullNameController.dispose();
    _userNameController.dispose();
    _passwordController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          imagePickerUser(press: () {}),
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
          SizedBox(
            height: 20,
          ),

          //
          // Login button
          SizedBox(
            height: 30,
          ),
          defaultButton(
            text: "Sign up",
            press: () {
              print(_emailController.toString());
              print(_fullNameController.toString());
              print(_userNameController.toString());
              print(_passwordController.toString());
            },
          ),
        ],
      ),
    );
  }
}
