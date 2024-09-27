import 'package:flutter/material.dart';
import 'package:newsapp/core/utils/database/database_helper.dart';

class DownloadScreen extends StatefulWidget {
  const DownloadScreen({super.key});

  @override
  State<DownloadScreen> createState() => _DownloadScreenState();
}

class _DownloadScreenState extends State<DownloadScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Downloaded News"),
      ),
      body: SafeArea(
        child: FutureBuilder(
          future: DatabaseHelper.instance.getDatabaseArticles(),
          builder: (context, snapshot) {
            return ListView.builder(
              itemCount: snapshot.data?.length ?? 0,
              itemBuilder: (context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Text(snapshot.data?[index].author ?? ""),
                    Text(snapshot.data?[index].title ?? ""),
                    Text(snapshot.data?[index].description ?? ""),
                    SizedBox(
                      height: 20,
                    )
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }
}
