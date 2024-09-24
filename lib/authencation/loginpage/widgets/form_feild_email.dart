import 'package:flutter/material.dart';

class FormFieldForEmail extends StatelessWidget {
  const FormFieldForEmail({
    super.key,
    required this.emailController,
  });

  final TextEditingController emailController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return "Email can't be empty";
        } else if (value.length < 3) {
          return "Email length too short";
        } else {
          return null;
        }
      },
      controller: emailController,
      decoration: const InputDecoration(
        hintText: 'Enter your email',
        border: OutlineInputBorder(),
        filled: true,
        fillColor: Color(0xFFF6F6F6),
      ),
    );
  }
}