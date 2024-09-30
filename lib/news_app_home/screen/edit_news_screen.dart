import 'package:flutter/material.dart';
import 'package:newsapp/news_app_home/model/newsapp_model.dart';
import 'package:newsapp/core/utils/database/database_helper.dart';

class EditNewsScreen extends StatefulWidget {
  final Articles article;

  const EditNewsScreen({super.key, required this.article});

  @override
  EditNewsScreenState createState() => EditNewsScreenState();
}

class EditNewsScreenState extends State<EditNewsScreen> {
  final TextEditingController _authorController = TextEditingController();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Initialize controllers with current article data
    _authorController.text = widget.article.author!;
    _titleController.text = widget.article.title!;
    _descriptionController.text = widget.article.description!;
  }

  void _saveChanges() async {
    // Validate input
    if (_authorController.text.isEmpty ||
        _titleController.text.isEmpty ||
        _descriptionController.text.isEmpty) {
      // Show an error message if any field is empty
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please fill all fields")),
      );
      return;
    }

    final updatedArticle = Articles(
      id: widget.article.id, // Ensure the ID is not null
      author: _authorController.text,
      title: _titleController.text,
      description: _descriptionController.text,
      url: widget.article.url,
      urlToImage: widget.article.urlToImage,
      publishedAt: widget.article.publishedAt,
      content: widget.article.content,
    );

    await DatabaseHelper.instance.updateArticle(updatedArticle.toMap());
    Navigator.pop(context, true); // Go back to the previous screen
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit News"),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: _saveChanges,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _authorController,
              decoration: InputDecoration(labelText: "Author"),
            ),
            TextField(
              controller: _titleController,
              decoration: InputDecoration(labelText: "Title"),

            ),
            TextField(
              controller: _descriptionController,
              decoration: InputDecoration(labelText: "Description"),

            ),
          ],
        ),
      ),
    );
  }
}
