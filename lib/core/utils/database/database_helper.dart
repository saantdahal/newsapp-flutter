import 'package:newsapp/news_app_home/model/newsapp_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  // to make this a singleton class
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;

  static const dbName = "news.db";
  static const tableName = "article";

  static const String columnAuthor = "author";
  static const String columnId = "id";
  static const String columnTitle = "title";
  static const String columnDesc = "description";
  static const String columnUrl = "url";
  static const String columnUrlToImage = "urlToImage";
  static const String columnPublish = "publishedAt";
  static const String columnContent = "content";

  Future<Database?> get database async {
    return _database ??= await initDb();
  }

  Future<Database?> initDb() async {
    String path = join(await getDatabasesPath(), dbName);
    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        db.execute('''
          CREATE TABLE $tableName (
            $columnId INTEGER PRIMARY KEY,
            $columnAuthor TEXT NOT NULL,
            $columnContent TEXT NOT NULL,
            $columnDesc TEXT NOT NULL,
            $columnPublish TEXT NOT NULL,
            $columnTitle TEXT NOT NULL,
            $columnUrl TEXT NOT NULL,
            $columnUrlToImage TEXT NOT NULL
          )
        ''');
      },
    );
  }

  // Insert a new article into the database
  Future<void> insert(Articles articles) async {
    final db = await database;
    await db!.insert(
      tableName,
      articles.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // Retrieve all articles from the database
  Future<List<Articles>?> getDatabaseArticles() async {
    final db = await database;
    final List<Map<String, dynamic>> retrieveData = await db!.query(tableName);
    return retrieveData.map((e) => Articles.fromJson(e)).toList();
  }

  // Delete an article from the database by its id
  Future<void> deleteArticle(int id) async {
    final db = await database;
    await db!.delete(
      tableName,
      where: '$columnId = ?',
      whereArgs: [id],
    );
  }

  // Update an existing article in the database
  Future<void> updateArticle(Map<String, dynamic> articleData) async {
    final db = await database;
    await db!.update(
      tableName,
      articleData,
      where: '$columnId = ?',
      whereArgs: [articleData[columnId]],
    );
  }
}
