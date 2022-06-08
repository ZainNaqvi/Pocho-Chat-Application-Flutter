import 'package:flutter/material.dart';

IconButton appbarActions({required VoidCallback press}) {
  return IconButton(
    onPressed: press,
    icon: Icon(
      Icons.message_outlined,
    ),
  );
}
