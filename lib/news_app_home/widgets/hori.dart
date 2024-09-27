import 'package:flutter/material.dart';
import 'package:newsapp/news_app_home/model/newsapp_model.dart';
// Make sure you have this helper

class HorizontalNewsWidget extends StatelessWidget {
  const HorizontalNewsWidget({
    super.key,
    required this.newsItem,
    required this.onSave, // Add onSave callback
  });

  final Articles newsItem;
  final VoidCallback onSave; // Save callback

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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Save button to save the article to the database
                  IconButton(
                    icon: const Icon(Icons.save, color: Colors.blue),
                    onPressed: onSave, // Call the onSave callback when pressed
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
