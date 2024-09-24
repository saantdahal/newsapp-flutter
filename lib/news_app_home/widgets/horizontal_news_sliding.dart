import 'package:flutter/material.dart';
import 'package:newsapp/news_app_home/model/newsapp_model.dart';
import 'package:newsapp/news_app_home/widgets/sliding_news_containers.dart';

class HorizantalNewsSliding extends StatelessWidget {
  const HorizantalNewsSliding({
    super.key,
    required Future<List<Articles>?>? newsArticles,
  }) : _newsArticles = newsArticles;

  final Future<List<Articles>?>? _newsArticles;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Articles>?>(
      future: _newsArticles,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Text('No news available.');
        } else {
          return SizedBox(
            height: 220,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return buildSlidingContainer(
                  snapshot.data![index].urlToImage ??
                      'assets/placeholder.png',
                  snapshot.data![index].title ?? 'N/A',
                );
              },
              separatorBuilder: (BuildContext context, int index) =>
                  const SizedBox(width: 20),
              itemCount: snapshot.data?.length ?? 0,
            ),
          );
        }
      },
    );
  }
}
