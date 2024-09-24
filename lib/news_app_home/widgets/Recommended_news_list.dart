import 'package:flutter/material.dart';
import 'package:newsapp/news_app_home/widgets/mainpagenewswid.dart';
import 'package:newsapp/news_app_home/model/newsapp_model.dart';

class RecommendedNews extends StatelessWidget {
  const RecommendedNews({
    super.key,
    required this.articleList,
  });

  final List<Articles>? articleList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: articleList?.length ?? 0,
      itemBuilder: (context, index) {
        final newsItem = articleList?[index];
        final Map<String, String> newsItemMap = {
          'imageurl': newsItem?.urlToImage ?? 'assets/images/default.jpg',
          'headLine': newsItem?.title ?? 'No headline available',
          'publishedAt': newsItem?.publishedAt ?? "Date unavailable",
          'news': newsItem?.description ?? 'No description available',
        };

        return GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, '/newsPage', arguments: newsItemMap);
          },
          child: Vertical_Widget(newsItem: newsItemMap),
        );
      },
    );
  }
}
