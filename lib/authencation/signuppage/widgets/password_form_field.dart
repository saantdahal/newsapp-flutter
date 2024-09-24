import 'package:flutter/material.dart';

class PasswordFormField extends StatelessWidget {
  const PasswordFormField({
    super.key,
    required this.confirmPasswordController,
    required this.passwordController,
  });

  final TextEditingController confirmPasswordController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: confirmPasswordController,
      validator: (value) {
        if (value!.isEmpty) {
          return "Confirm password can't be empty";
        } else if (value != passwordController.text) {
          return "Passwords do not match";
        } else {
          return null;
        }
      },
      decoration: InputDecoration(
        hintText: 'Confirm Password',
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

