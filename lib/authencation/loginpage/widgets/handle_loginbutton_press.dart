import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // Handle login button press
        if (formKey.currentState!.validate()) {
          // ignore: avoid_print
          print(
              "email:${emailController.text} password:${passwordController.text}");
          Navigator.pushNamed(context, '/homePage');
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