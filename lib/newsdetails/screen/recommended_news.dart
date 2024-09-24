import 'package:flutter/material.dart';
import 'package:newsapp/newsdetails/model/news_item.dart';

class RecommendationNewsSection extends StatelessWidget {
  final List<NewsItemModel> newsItems;

  const RecommendationNewsSection({
    super.key,
    required this.newsItems,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80 *
          newsItems.length
              .toDouble(), // Dynamic height based on the number of items
      child: ListView.builder(
        itemCount: newsItems.length,
        itemBuilder: (context, index) {
          final newsItem = newsItems[index];
          return ListTile(
            leading: Image.asset(newsItem.image),
            title: Text(newsItem.title),
            subtitle: Text(newsItem.subtitle),
            trailing: newsItem.trailing,
          );
        },
      ),
    );
  }
}
