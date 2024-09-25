import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart'; // Import shared_preferences

class LoginButtonPress extends StatelessWidget {
  const LoginButtonPress({
    super.key,
    required this.formKey,
    required this.emailController,
    required this.passwordController,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  // Method to check stored credentials
  Future<void> _checkLogin(BuildContext context) async {
    // Retrieve stored email and password from SharedPreferences
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? storedEmail = prefs.getString('email');
    String? storedPassword = prefs.getString('password');

    // Get the entered email and password
    String enteredEmail = emailController.text;
    String enteredPassword = passwordController.text;

    if (enteredEmail == storedEmail && enteredPassword == storedPassword) {
      Navigator.pushNamed(context, '/ShowDataPage');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Invalid email or password')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // Handle login button press
        if (formKey.currentState!.validate()) {
          // Check login credentials
          _checkLogin(context);
        }
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.black,
        minimumSize: const Size(double.infinity, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      ),
      child: const Text(
        'Login',
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
