import 'package:flutter/material.dart';

Column appbarTitle() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        "P O C H O",
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 25,
        ),
      ),
      SizedBox(
        height: 2,
      ),
      Text(
        "Jo Dil Kare Pocho",
        style: TextStyle(
          color: Colors.grey,
          fontSize: 10,
        ),
      ),
    ],
  );
}
