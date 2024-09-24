import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:newsapp/api/api.dart';
import 'package:newsapp/news_app_home/model/newsapp_model.dart';
import 'package:newsapp/news_app_home/widgets/Recommended_news_list.dart';
import 'package:newsapp/news_app_home/widgets/bottom_navigationbar.dart';
import 'package:newsapp/news_app_home/widgets/circle_avatar.dart';
import 'package:newsapp/news_app_home/widgets/horizontal_news_sliding.dart';
import 'package:newsapp/news_app_home/widgets/news_category.dart';
import 'dart:io';
import 'package:newsapp/news_app_home/widgets/text_form_field.dart'; // Import custom widgets

class NewsApp extends StatefulWidget {
  const NewsApp({super.key});

  @override
  NewsAppState createState() => NewsAppState();
}

class NewsAppState extends State<NewsApp> {
  List<Articles>? articleList = [];
  bool isLoading = false;
  final ApiService apiService = ApiService();
  final TextEditingController searchController = TextEditingController();
  final ImagePicker _picker = ImagePicker();
  File? _image;
  Future<List<Articles>?>? _newsArticles;

  @override
  void initState() {
    super.initState();
    getArticleList();
  }

  Future<void> getArticleList() async {
    setState(() {
      isLoading = true;
    });
    try {
      articleList = await apiService.fetchNews();
      _newsArticles = Future.value(articleList);
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              decoration: const BoxDecoration(color: Colors.blue),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (BuildContext context) {
                          return Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              ListTile(
                                leading: const Icon(Icons.photo_library),
                                title: const Text('Pick from Gallery'),
                                onTap: () {
                                  _pickImage(ImageSource.gallery);
                                  Navigator.pop(context);
                                },
                              ),
                              ListTile(
                                leading: const Icon(Icons.camera_alt),
                                title: const Text('Take a Picture'),
                                onTap: () {
                                  _pickImage(ImageSource.camera);
                                  Navigator.pop(context);
                                },
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: circleAvaterWidgets(image: _image),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Nisila',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ],
              ),
            ),
            // Add other Drawer items here...
          ],
        ),
      ),
      appBar: AppBar(
        title: RichText(
          text: const TextSpan(
            children: [
              TextSpan(
                text: 'Good Morning, ',
                style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.w500,
                    fontSize: 20),
              ),
              TextSpan(
                text: 'Nisila',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 20),
              ),
            ],
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.notifications_active_outlined),
            onPressed: () {
              debugPrint("Notification icon pressed");
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormFieldWidgets(searchController: searchController),
              const SizedBox(height: 20),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Discovery',
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                  Text('Enjoy Morning Coffee with News'),
                ],
              ),
              const SizedBox(height: 10),
              HorizantalNewsSliding(newsArticles: _newsArticles),
              const SizedBox(height: 20),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.0),
                child: NewsCategory(),
              ),
              const SizedBox(height: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Recommended',
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.4,
                    child: RecommendedNews(articleList: articleList),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const ButtomNavigationBarWidgets(),
    );
  }
}
