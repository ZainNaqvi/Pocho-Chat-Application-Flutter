import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

imagePicker(ImageSource imageSource) async {
  // creating the instance here...
  ImagePicker _imagePicker = ImagePicker();
  //picking process
  XFile? _file = await _imagePicker.pickImage(source: imageSource);
  // if the value is null
  if (_file != null) {
    // returning in bytes
    return _file.readAsBytes();
  }
  // for check value == null
  print("NO image is selected.");
}
