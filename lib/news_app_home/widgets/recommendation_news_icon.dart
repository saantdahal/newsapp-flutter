import 'package:flutter/material.dart';

Widget categoryItems(String label) {
  return Padding(
    padding: const EdgeInsets.only(right: 4.0),
    child: Chip(
      label: Text(label),
      backgroundColor: const Color.fromARGB(255, 9, 41, 224),
      labelStyle: const TextStyle(color: Colors.white),
    ),
  );
}