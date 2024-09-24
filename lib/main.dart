import 'package:flutter/material.dart';
import 'package:newsapp/authencation/defaultpage/screen/main_page.dart';
import 'package:newsapp/authencation/signuppage/screen/signup_page.dart';
import 'profile/screen/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //theme: ThemeData(brightness: Brightness.dark),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const MainLoginPage(),
        '/home': (context) => const HomePage(),
        '/signup': (context) => const SignupPage(),
        
      },
    );
  }
}
