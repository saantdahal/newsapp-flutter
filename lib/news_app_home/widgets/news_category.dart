import 'package:flutter/material.dart';
import 'package:newsapp/news_app_home/widgets/recommendation_news_icon.dart';

class NewsCategory extends StatelessWidget {
  const NewsCategory({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          'All',
          'Technology',
          'Education',
          'Sports',
          'Health'
        ].map((category) {
          return categoryItems(category);
        }).toList(),
      ),
    );
  }
}
