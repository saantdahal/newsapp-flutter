import 'package:flutter/material.dart';
import 'package:newsapp/news_app_home/model/newsapp_model.dart';
import 'package:newsapp/news_app_home/provider/favnews_provider.dart';
import 'package:provider/provider.dart';

class HorizontalNewsWidget extends StatelessWidget {
  const HorizontalNewsWidget({
    super.key,
    required this.newsItem,
  });

  final Articles newsItem;

  @override
  Widget build(BuildContext context) {
    return Padding(
      //horizontal news feed
      padding: const EdgeInsets.all(8),
      child: Container(
        width: 280,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
            image: newsItem.urlToImage != null
                ? NetworkImage(newsItem.urlToImage!) // Fetch image from URL
                : const AssetImage(
                    'assets/images/broken-img.png'), // Fallback image
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(1),
              BlendMode.softLight,
            ),
            onError: (error, stackTrace) {
              // Handle the error here
              debugPrint('Error loading image $error');
            },
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
              const SizedBox(height: 5),
              Text(
                newsItem.publishedAt ?? '',
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 5),
            ],
          ),
        ),
      ),
    );
  }
}

class VerticalNewsWidget extends StatelessWidget {
  const VerticalNewsWidget({
    super.key,
    required this.newsItemMap,
    required this.newsItem,
  });

  final Map<String, String> newsItemMap;
  final Articles? newsItem;

  @override
  Widget build(BuildContext context) {
    //vertical newsfeed
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(
                context,
                '/newsPage',
                arguments: newsItemMap,
              );
            },
            child: Image.network(
              newsItem!.urlToImage != null && newsItem!.urlToImage!.isNotEmpty
                  ? newsItem!.urlToImage!
                  : '',
              width: 80,
              height: 80,
              fit: BoxFit.cover,
              errorBuilder: (context, url, error) {
                return const SizedBox(
                  width: 80,
                  height: 80,
                  child: Icon(Icons.error),
                );
              },
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      '/newsPage',
                      arguments: newsItemMap,
                    );
                  },
                  child: Text(
                    newsItem?.title ?? "",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      newsItem?.publishedAt ?? "",
                      style: const TextStyle(color: Colors.grey),
                    ),
                    Consumer<FavNewsProvider>(
                      builder: (context, newsProvider, _) {
                        bool isPressed =
                            newsProvider.favArticleList?.contains(newsItem) ??
                                false;
                        return IconButton(
                          onPressed: () {
                            newsProvider.toggleFav(newsItem);
                          },
                          icon: Icon(
                            isPressed ? Icons.favorite : Icons.favorite_outline,
                            color: Colors.red,
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
