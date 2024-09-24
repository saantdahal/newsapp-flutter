// Widget to create sliding news containers
import 'package:flutter/material.dart';

Widget buildSlidingContainer(
    String imagePath, String title /*, String subtitle*/) {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 8.0),
    height: 200,
    width: 300,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      image: DecorationImage(
        image: AssetImage(imagePath),
        fit: BoxFit.cover,
      ),
    ),
    child: Align(
      alignment: Alignment.bottomLeft,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              title,
              style: const TextStyle(color: Colors.white, fontSize: 12),
            ),
            // Text(
            //   subtitle,
            //   style: const TextStyle(
            //       color: Colors.white, fontWeight: FontWeight.bold),
            // ),
          ],
        ),
      ),
    ),
  );
}
