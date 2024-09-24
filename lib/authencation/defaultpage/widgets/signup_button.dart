import 'package:flutter/material.dart';
import 'package:newsapp/authencation/signuppage/screen/signup_page.dart';

class SignupButton extends StatelessWidget {
  const SignupButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => const SignupPage()), // SignupPage
        );
      },
      style: ElevatedButton.styleFrom(
        side: const BorderSide(color: Colors.black, width: 2),
        padding:
            const EdgeInsets.symmetric(horizontal: 164, vertical: 20),
        textStyle:
            const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
        ),
      ),
      child: const Text(
        "Register",
        style: TextStyle(color: Colors.black),
      ),
    );
  }
}