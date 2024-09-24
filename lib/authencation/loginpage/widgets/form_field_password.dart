import 'package:flutter/material.dart';

class FormFieldPassword extends StatelessWidget {
  const FormFieldPassword({
    super.key,
    required this.passwordController,
  });

  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: passwordController,
      validator: (value) {
        if (value!.isEmpty) {
          return "Password can't be empty";
        } else if (value.length < 3) {
          return "Password length too short";
        } else if (!RegExp(r'^(?=.*[A-Z])').hasMatch(value)) {
          return "Capital letter is missing";
        } else if (!RegExp(r'^(?=.*?[!#\$&*~])').hasMatch(value)) {
          return "Special character is missing";
        } else {
          return null;
        }
      },
      decoration: InputDecoration(
        hintText: 'Enter your password',
        border: const OutlineInputBorder(),
        filled: true,
        fillColor: const Color(0xFFF6F6F6),
        suffixIcon: IconButton(
          icon: const Icon(Icons.visibility),
          onPressed: () {
            // Handle password visibility toggle
          },
        ),
      ),
    );
  }
}
