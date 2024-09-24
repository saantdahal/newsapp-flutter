import 'package:flutter/material.dart';
import 'package:newsapp/news_app_home/model/newsapp_model.dart';

// ignore: camel_case_types
class Horizontal_News_Widget extends StatelessWidget {
  const Horizontal_News_Widget({super.key, required this.newsItem});

  final Articles newsItem;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Container(
        width: 280,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
            image: newsItem.urlToImage != null
                ? NetworkImage(newsItem.urlToImage!) // Fetch image from URL
                : const AssetImage('assets/busi.jpg')
                    as ImageProvider, // Fallback image
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(1),
              BlendMode.softLight,
            ),
            /*image: DecorationImage(
            image: AssetImage(newsItem['imageUrl']!),*/
            // Apply fit here
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                newsItem.title ?? '',
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
              /*Text(
                newsItem['category']!.toUpperCase(),
                style: TextStyle(
                  color: Colors.white.withOpacity(0.8),
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),*/
              const SizedBox(height: 5),
              Text(
                newsItem.publishedAt ?? '',
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
                /* newsItem['title']!,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),*/
              ),
              const SizedBox(height: 5),
              /*Text(
                newsItem['date']!,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                ),
              ),*/
            ],
          ),
        ),
      ),
    );
  }
}

// ignore: camel_case_types
class Vertical_Widget extends StatelessWidget {
  const Vertical_Widget({
    super.key,
    required this.newsItem,
  });

  final Map<String, String> newsItem;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          Image.network(
            newsItem['imageurl']!,
            width: 80,
            height: 80,
            fit: BoxFit.cover,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  newsItem['headLine']!,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  newsItem['publishedAt']!,
                  style: const TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
