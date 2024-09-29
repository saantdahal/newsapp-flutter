import 'package:flutter/material.dart';
import 'package:newsapp/core/utils/database/database_helper.dart';
import 'package:newsapp/news_app_home/model/newsapp_model.dart';
import 'edit_news_screen.dart'; // Import your EditNewsScreen

class DownloadScreen extends StatefulWidget {
  const DownloadScreen({super.key});

  @override
  State<DownloadScreen> createState() => _DownloadScreenState();
}

class _DownloadScreenState extends State<DownloadScreen> {
  Future<void> _deleteNews(int id) async {
    await DatabaseHelper.instance.deleteArticle(id);
    setState(() {}); // Refresh the screen after deletion
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("News deleted successfully")),
    );
  }

  void _editNews(Articles article) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditNewsScreen(article: article),
      ),
    ).then((_) => setState(() {})); // Refresh the screen after editing
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Downloaded News"),
      ),
      body: SafeArea(
        child: FutureBuilder<List<Articles>?>(
          future: DatabaseHelper.instance.getDatabaseArticles(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }

            if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Center(child: Text("No downloaded news available."));
            }

            return ListView.builder(
              itemCount: snapshot
                  .data!.length, // No need for ?? 0 since we check earlier
              itemBuilder: (context, index) {
                final article = snapshot.data![index];

                // Ensure article.id is not null before using it
                return ListTile(
                  title: Text(article.title ?? "No Title"),
                  subtitle: Text(article.author ?? "Unknown Author"),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () => _editNews(article),
                      ),
                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text("Delete News"),
                                content: Text(
                                    "Are you sure you want to delete this news?"),
                                actions: [
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.of(context).pop(),
                                    child: Text("Cancel"),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      if (article.id != null) {
                                        _deleteNews(
                                            article.id!); // Use null assertion
                                      } else {
                                        // Handle case where ID is null (optional)
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                              content: Text(
                                                  "Error: Article ID is null.")),
                                        );
                                      }
                                      Navigator.of(context)
                                          .pop(); // Close the dialog
                                    },
                                    child: Text("Delete"),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                      ),
                    ],
                  ),
                  onTap: () => _editNews(article), // Optional: Edit on tap
                );
              },
            );
          },
        ),
      ),
    );
  }
}
