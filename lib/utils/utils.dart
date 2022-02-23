import "package:flutter/material.dart";
import 'package:image_picker/image_picker.dart';

pickImage(
  ImageSource source,
) async {
  final ImagePicker _imagePicker = ImagePicker();
  XFile? _file = await _imagePicker.pickImage(source: source);
  if (_file != null) {
    // This is another option from the dart io... Bt we're not using it because it's not accessible in the browser
    // File(_file.path);
    return await _file.readAsBytes();
  }
  print("No image selected");
}
