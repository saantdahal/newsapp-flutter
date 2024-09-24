import 'dart:io';
import 'package:flutter/material.dart';

class circleAvaterWidgets extends StatelessWidget {
  const circleAvaterWidgets({
    super.key,
    required File? image,
  }) : _image = image;

  final File? _image;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 40,
      backgroundImage: _image != null ? FileImage(_image) : null,
      backgroundColor: Colors.grey[300],
      child: _image == null
          ? const Icon(Icons.person, size: 40, color: Colors.white)
          : null,
    );
  }
}
