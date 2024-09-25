import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/favnews_provider.dart';

class FavNewsPage extends StatelessWidget {
  const FavNewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        title: const Text('Favorite News'),
        centerTitle: true,
      ),
      body: Consumer<FavNewsProvider>(
        builder: (context, favProvider, child) {
          if (favProvider.favArticleList!.isEmpty) {
            return const Center(
              child: Text("No favorite news articles yet!"),
            );
          }

          return ListView.builder(
            itemCount: favProvider.favArticleList?.length,
            itemBuilder: (context, index) {
              final article = favProvider.favArticleList?[index];

              // Convert the Articles object to a Map<String, String>
              final Map<String, String> articleMap = {
                'imageurl': article?.urlToImage ?? 'No image available',
                'headLine': article?.title ?? 'No headline available',
                'publishedAt': article?.publishedAt ?? "Date unavailable",
                'news': article?.description ?? 'No news description available',
              };

              return Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          '/newsPage',
                          arguments: articleMap,
                        );
                      },
                      child: Image.network(
                        article?.urlToImage ?? "",
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
                                arguments: articleMap,
                              );
                            },
                            child: Text(
                              article?.title ?? "",
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ),
                          const SizedBox(height: 5),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                article?.publishedAt ?? "",
                                style: const TextStyle(color: Colors.grey),
                              ),
                              IconButton(
                                onPressed: () {
                                  favProvider.toggleFav(article);
                                },
                                icon: const Icon(
                                  Icons.favorite,
                                  color: Colors.red,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
