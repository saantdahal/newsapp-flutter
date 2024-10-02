import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/authencation/defaultpage/screen/main_page.dart';
import 'package:newsapp/authencation/loginpage/screen/login_page.dart';
import 'package:newsapp/authencation/signuppage/screen/signup_page.dart';
import 'package:newsapp/core/notification/push_notification.dart';
import 'package:newsapp/firebase_options.dart';
import 'package:newsapp/news_app_home/provider/favnews_provider.dart';
import 'package:newsapp/news_app_home/screen/dashboard_page.dart';
import 'package:newsapp/news_app_home/screen/downloaded_news_page.dart';
import 'package:newsapp/news_app_home/screen/fav_news_page.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final PushNotificationService _pushNotificationService =
      PushNotificationService();

  @override
  void initState() {
    super.initState();
    _initializeFCM();
  }

  // Initialize FCM and get the token
  void _initializeFCM() async {
    String? token =
        await _pushNotificationService.getFcmToken(); // Fetch the token
    await _pushNotificationService
        .foregroundMessaging(); // Call foreground messaging
    print('FCM Token from main.dart: $token'); // Print the token
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => FavNewsProvider()..getArticleList(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        //home: const MainPage(),
        routes: {
          '/': (context) => const MainLoginPage(),
          '/newsHomePage': (context) => const NewsApp(),
          '/loginPage': (context) => const LoginPage(),
          '/registerPage': (context) => const SignupPage(),
          '/favNewsPage': (context) => const FavNewsPage(),
          '/downloadedNews': (context) => const DownloadScreen(),
        },
      ),
    );
  }
}
