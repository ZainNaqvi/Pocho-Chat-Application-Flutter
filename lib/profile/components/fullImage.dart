import 'package:flutter/material.dart';

class ShowFULLImage extends StatelessWidget {
  final imageURL;
  const ShowFULLImage({
    Key? key,
    required this.imageURL,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back_ios,
          ),
        ),
        backgroundColor: Colors.black,
      ),
      body: Center(child: Image.network(imageURL)),
    );
  }
}
