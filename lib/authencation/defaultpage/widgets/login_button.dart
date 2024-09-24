import 'package:flutter/material.dart';
import 'package:newsapp/authencation/loginpage/screen/login_page.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => const LoginPage()), // SignupPage
        );
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.black,
        padding: const EdgeInsets.symmetric(horizontal: 170, vertical: 20),
        textStyle: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
        ),
      ),
      child: const Text(
        "Login",
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
