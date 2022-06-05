import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pocho_project/model/users.dart';
import 'package:pocho_project/providers/userProviders.dart';
import 'package:provider/provider.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    // UserCreaditials user = Provider.of<UserProviders>(context).getUser;
    return Container(
      child: Center(
        child: Text(" welcome!  to the home screen."),
      ),
    );
  }
}
