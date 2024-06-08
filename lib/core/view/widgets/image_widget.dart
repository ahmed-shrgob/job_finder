import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'package:job_finder/constants/cons_colors.dart';

class ProfileWidget extends StatefulWidget {
  File? image;
  ProfileWidget({required this.image});
  @override
  _ProfileWidgetState createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget> {
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      print(pickedFile.path);
      setState(() {
        widget.image = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _pickImage,
      child: Stack(
        children: [
          CircleAvatar(
            radius: 60,
            backgroundColor: Colors.grey[300],
            backgroundImage: widget.image != null ? FileImage(widget.image!) : null,
            child: widget.image == null
                ? Icon(
                    Icons.person,
                    color: Colors.grey[800],
                    size: 50,
                  )
                : null,
          ),
          Positioned(
            bottom: 0,
            left: 10,
            child: CircleAvatar(
                radius: 15,
                backgroundColor: AppColor.primaryColor,
                child: Icon(
                  Icons.camera_alt,
                  color: Colors.white,
                  size: 20,
                )),
          )
        ],
      ),
    );
  }
}
