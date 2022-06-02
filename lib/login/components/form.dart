import 'package:flutter/material.dart';
import 'package:pocho_project/login/components/customInputDecoration.dart';
import 'package:pocho_project/login/components/eyeController.dart';

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

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          // email field here....
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            decoration: customInputDecoration(
              icon: Icons.email_outlined,
              press: () {},
              text: "Enter your email",
            ),
          ),
          // password field here....
          SizedBox(
            height: 10,
          ),
          TextFormField(
            keyboardType: TextInputType.text,
            decoration: customInputDecoration(
              icon: Icons.remove_red_eye_outlined,
              press: () {
                _obscure.updateIsObscure();
                setState(() {});
                print(_obscure.isObscure);
              },
              text: "Enter your password",
            ),
            obscureText: _obscure.isObscure,
          ),
        ],
      ),
    );
  }
}
