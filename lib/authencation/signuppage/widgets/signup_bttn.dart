import 'package:flutter/material.dart';
import 'package:newsapp/authencation/signuppage/screen/show_data_page.dart';
import 'package:shared_preferences/shared_preferences.dart'; // Import the page to display data

class SignupBttn extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;

  const SignupBttn({
    super.key,
    required this.emailController,
    required this.passwordController,
  });

  // Email validation function
  bool _isValidEmail(String email) {
    String emailPattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
    RegExp regex = RegExp(emailPattern);
    return regex.hasMatch(email);
  }

  // Password validation function
  bool _isValidPassword(String password) {
    // Define password rules here (e.g., minimum 6 characters, contains a number, etc.)
    return password.length >= 6;
  }

  Future<void> _storeUserData(String email, String password) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('email', email);
    await prefs.setString('password', password);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          String email = emailController.text;
          String password = passwordController.text;

          // Check if fields are empty
          if (email.isEmpty || password.isEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Please fill all fields')),
            );
          }
          // Check if the email is valid
          else if (!_isValidEmail(email)) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Please enter a valid email')),
            );
          }
          // Check if the password is valid
          else if (!_isValidPassword(password)) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                  content: Text('Password must be at least 6 characters long')),
            );
          }
          // If everything is valid, store data and navigate
          else {
            _storeUserData(email, password).then((_) {
              // ignore: use_build_context_synchronously
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Signup Successful!')),
              );

              // Navigate to next page (ShowDataPage)
              Navigator.push(
                // ignore: use_build_context_synchronously
                context,
                MaterialPageRoute(
                  builder: (context) => const ShowDataPage(),
                ),
              );
            });
          }
        },
        style: ElevatedButton.styleFrom(
          side: const BorderSide(color: Colors.black, width: 2),
          padding: const EdgeInsets.symmetric(horizontal: 140, vertical: 20),
          textStyle: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.zero,
          ),
        ),
        child: const Text(
          "Register",
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}
