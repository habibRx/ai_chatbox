import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ImagePickerService {
  final ImagePicker _picker = ImagePicker();

  Future<File?> pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      return File(pickedFile.path);
    }
    return null;
  }
}
