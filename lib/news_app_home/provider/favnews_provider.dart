import 'package:flutter/material.dart';
import 'package:newsapp/api/api.dart';
import 'package:newsapp/news_app_home/model/newsapp_model.dart';


class FavNewsProvider extends ChangeNotifier {
  List<Articles>? articleList = [];
  List<Articles>? favArticleList = [];
  ApiService apiService = ApiService();
  bool isLoading = false;
  bool isFav = false;
  void getArticleList() async {
    try {
      isLoading = true;
      articleList = await apiService.fetchNews();
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  void toggleFav(Articles? article) {
    var isArticlePresent =
        favArticleList?.any((element) => element.title == article?.title);
    if (isArticlePresent ?? false) {
      favArticleList?.remove(article);
    } else {
      favArticleList?.add(article!);
    }
    notifyListeners();
  }
}