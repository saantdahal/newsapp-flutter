import 'package:flutter/material.dart';

class UsernameFormField extends StatelessWidget {
  const UsernameFormField({
    super.key,
    required this.emailController,
  });

  final TextEditingController emailController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return "Username can't be empty";
        } else if (value.length < 3) {
          return "Username length too short";
        } else {
          return null;
        }
      },
      controller: emailController,
      decoration: const InputDecoration(
        hintText: 'Username',
        border: OutlineInputBorder(),
        filled: true,
        fillColor: Color(0xFFF6F6F6),
      ),
    );
  }
}
