import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ShowDataPage extends StatefulWidget {
  const ShowDataPage({super.key});

  @override
  State<ShowDataPage> createState() => _ShowDataPageState();
}

class _ShowDataPageState extends State<ShowDataPage> {
  String? storedEmail;
  String? storedPassword;

  // Method to retrieve data from SharedPreferences
  Future<void> _retrieveUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      storedEmail = prefs.getString('email');
      storedPassword = prefs.getString('password');
    });
  }

  @override
  void initState() {
    super.initState();
    _retrieveUserData();  // Retrieve the data when the page initializes
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Information'),
      ),
      body: Center(
        child: storedEmail != null && storedPassword != null
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Email: $storedEmail'),
                  const SizedBox(height: 10),
                  Text('Password: $storedPassword'),
                ],
              )
            : const CircularProgressIndicator(),  // Show loading indicator until data is retrieved
      ),
    );
  }
}
