import 'package:flutter/material.dart';

class NewsItemModel {
  final String image;
  final String title;
  final String subtitle;
  final Icon trailing;

  NewsItemModel({
    required this.image,
    required this.title,
    required this.subtitle,
    required this.trailing,
  });
}