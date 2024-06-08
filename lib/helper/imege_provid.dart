import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:dio/dio.dart';

class ImageProv extends ChangeNotifier {
  File? _image;

  File? get image => _image;

  final ImagePicker _picker = ImagePicker();
  final Dio _dio = Dio();

  Future<void> pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      _image = File(pickedFile.path);
      notifyListeners();
    }
  }

  Future<void> uploadImage() async {
    if (_image == null) return;

    String fileName = _image!.path.split('/').last;
    FormData formData = FormData.fromMap({
      "image": await MultipartFile.fromFile(_image!.path, filename: fileName),
    });

    try {
      Response response = await _dio.post("https://example.com/upload", data: formData);
      if (response.statusCode == 200) {
        print("Image uploaded successfully");
      } else {
        print("Image upload failed");
      }
    } catch (e) {
      print("Error uploading image: $e");
    }
  }
}
