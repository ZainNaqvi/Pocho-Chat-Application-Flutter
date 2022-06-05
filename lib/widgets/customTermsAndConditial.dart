import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pocho_project/home/home.dart';
import 'package:pocho_project/widgets/customSnakeBar.dart';

showalert(BuildContext context) {
  showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              CircleAvatar(
                key: UniqueKey(),
                backgroundImage:
                    NetworkImage("assets/images/default-profile.jpg"),
                backgroundColor: Colors.white.withOpacity(0.13),
                radius: 50,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Hi! Zain ",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 25.sp,
                ),
              ),
              Text(
                "Welcome to the social media of P O C H O ",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 10.sp,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Accepting this Agreement is a condition of using the Services provided by P O C H O",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 10.sp,
                ),
              ),
              Text(
                "That u do not send the bad content in Application and also not use the application in bad way.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 10.sp,
                ),
              ),
            ],
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context, false);
                  },
                  icon: Icon(
                    CupertinoIcons.hand_thumbsdown,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                IconButton(
                  onPressed: () {
                    Navigator.pop(context, true);
                  },
                  icon: Icon(CupertinoIcons.hand_thumbsup),
                ),
              ],
            ),
          ],
        );
      }).then((exit) {
    if (exit == null) return;
    if (exit) {
      Navigator.pushReplacementNamed(context, HomeScreen.routeName);
    } else {
      showSnakeBar("Thanks", context);
    }
  });
}
