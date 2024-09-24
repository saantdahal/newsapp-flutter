import 'package:flutter/material.dart';

class IconButtonWidgets extends StatelessWidget {
  const IconButtonWidgets({
    super.key,
    this.image,
  });

  final String? image;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Image.asset(
        image as String,
        height: 40,
        width: 40,
      ),
      iconSize: 40,
      onPressed: () {
        // Handle Google login
      },
    );
  }
}