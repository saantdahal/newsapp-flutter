import 'package:flutter/material.dart';
import 'package:newsapp/core/api/api.dart';
import 'package:newsapp/news_app_home/model/newsapp_model.dart';
import 'package:newsapp/news_app_home/provider/favnews_provider.dart';
import 'package:newsapp/news_app_home/widgets/hori.dart';
import 'package:provider/provider.dart';

class NewsApp extends StatefulWidget {
  const NewsApp({super.key});

  @override
  State<NewsApp> createState() => _NewsHomePageState();
}

class _NewsHomePageState extends State<NewsApp> {
  List<Articles>? articleList = [];

  bool isLoading = false;

  ApiService apiService = ApiService();

  void getArticleList() async {
    try {
      isLoading = true;
      articleList = await apiService.fetchNews();
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      isLoading = false;
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    getArticleList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        centerTitle: true,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Good Morning, ',
              style: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
            Text(
              'Nisola',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Icon(Icons.notification_add),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(
              children: [
                Expanded(
                  child: SearchBar(
                    padding: const WidgetStatePropertyAll<EdgeInsets>(
                        EdgeInsets.symmetric(horizontal: 20)),
                    onTap: () {},
                    trailing: <Widget>[
                      ElevatedButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(255, 128, 33, 243),
                            foregroundColor: Colors.white),
                        child: const Text("Search"),
                      )
                    ],
                    leading: const Icon(Icons.search),
                  ),
                ),
              ],
            ),
            const Text(
              "Discovery",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            const Text(
              "Enjoy news with morning cofee",
              style: TextStyle(color: Colors.grey),
            ),
            FutureBuilder(
                future: ApiService().fetchNews(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.hasError) {
                    return const Center(
                      child: Text("Error fetching data"),
                    );
                  } else if (snapshot.hasData) {
                    final newsList = snapshot.data!;
                    return SizedBox(
                      height: 200,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: newsList.length,
                        itemBuilder: (context, index) {
                          final newsItem = newsList[index];
                          final Map<String, String> newsItemMap = {
                            'imageurl': newsItem.urlToImage ??
                                'No image available', // Provide default image if null
                            'headLine':
                                newsItem.title ?? 'No headline available',
                            'publishedAt': newsItem.publishedAt ??
                                "Day of publishment unavailable",
                            'news': newsItem.description ??
                                'No news description available',
                          };
                          //horizontal news feed

                          return GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                '/newsPage',
                                arguments: newsItemMap,
                              );
                            },
                            // Pass the fetched API data to the widget
                            child: HorizontalNewsWidget(newsItem: newsItem),
                          );
                        },
                      ),
                    );
                  }
                  return const SizedBox();
                }),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(onPressed: () {}, child: const Text('All')),
                ElevatedButton(
                    onPressed: () {}, child: const Text('Technology')),
                ElevatedButton(onPressed: () {}, child: const Text('Sports')),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Recommended",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                TextButton(
                    onPressed: () {},
                    child: const Text(
                      "View All",
                      style: TextStyle(color: Colors.blue),
                    )),
              ],
            ),
            //using articleList to acess the api by object rather than a future builder
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.4,
              child: ListView.builder(
                itemCount: articleList?.length ?? 0,
                itemBuilder: (context, index) {
                  final newsItem = articleList?[index];
                  final Map<String, String> newsItemMap = {
                    'imageurl': newsItem?.urlToImage ?? 'No image available',
                    'headLine': newsItem?.title ?? 'No headline available',
                    'publishedAt': newsItem?.publishedAt ??
                        "Day of publishment unavailable",
                    'news': newsItem?.description ??
                        'No news description available',
                  };
                  //vertical newsfeed
                  return VerticalNewsWidget(
                      newsItemMap: newsItemMap, newsItem: newsItem);
                },
              ),
            ),
          ]),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(items: <BottomNavigationBarItem>[
        const BottomNavigationBarItem(
            icon: Icon(
              Icons.home_filled,
              color: Colors.blue,
            ),
            label: "Home"),
        const BottomNavigationBarItem(
            icon: Icon(
              Icons.download_for_offline,
              color: Colors.blue,
            ),
            label: "Downloads"),
        //reusable widget for fav icon
        BottomNavigationBarItem(
            icon: Consumer<FavNewsProvider>(
                builder: (context, favNewsProvider, child) {
              return Stack(children: [
                IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/favNewsPage');
                    },
                    icon: const Icon(
                      Icons.favorite,
                      color: Colors.blue,
                    )),
                Text(
                  '${favNewsProvider.favArticleList?.length ?? 0}',
                  style: const TextStyle(color: Colors.blue, fontSize: 12),
                )
              ]);
            }),
            label: "Favourites"),
      ]),
    );
  }
}
