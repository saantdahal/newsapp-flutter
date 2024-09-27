import 'dart:convert';
import 'package:http/http.dart' as http; // Import the http package
import 'package:newsapp/news_app_home/model/newsapp_model.dart';

class ApiService {
  Future<NewsApiCalling> fetchData() async {
    try {
      //durtion to delay
      await Future.delayed(const Duration(seconds: 1));
      final response = await http
          .get(Uri.parse("https://jsonplaceholder.typicode.com/albums/5"));

      if (response.statusCode == 200) {
        return NewsApiCalling.fromJson(
            jsonDecode(response.body) as Map<String, dynamic>);
      } else {
        throw Exception("something went wrong");
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<List<Articles>?> fetchNews() async {
    try {
      await Future.delayed(const Duration(seconds: 1));
      final response = await http.get(Uri.parse(
          "https://saurav.tech/NewsAPI/top-headlines/category/health/in.json"));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final List dataList = data['articles'];
        return dataList.map((item) => Articles.fromJson(item)).toList();
      } else {
        throw Exception("something went wrong");
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
