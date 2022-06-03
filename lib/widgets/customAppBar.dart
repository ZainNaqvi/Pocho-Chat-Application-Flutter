import 'package:flutter/material.dart';

AppBar customAppBar({
  required String text,
  required Color color,
  required VoidCallback press,
  required BuildContext context,
}) {
  return AppBar(
    backgroundColor: Colors.transparent,
    centerTitle: true,
    leading: IconButton(
      icon: Icon(
        Icons.arrow_back_ios_new_outlined,
        color: color,
      ),
      onPressed: press,
    ),
    title: Text(
      text,
      style: Theme.of(context).textTheme.bodyText1!.copyWith(
            color: Colors.grey,
          ),
    ),
  );
}
