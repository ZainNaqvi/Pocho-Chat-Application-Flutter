import 'package:flutter/material.dart';

Widget suffixicon({
  required IconData icon,
}) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(0, 10, 10, 10),
    child: Icon(
      icon,
      size: 30,
      color: Colors.grey,
    ),
  );
}
