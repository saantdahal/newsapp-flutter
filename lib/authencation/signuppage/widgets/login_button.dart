import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/authencation/loginpage/screen/login_page.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RichText(
        text: TextSpan(
          text: "Already have an account? ",
          style: const TextStyle(color: Colors.black),
          children: [
            TextSpan(
              text: 'Login Here',
              style: const TextStyle(color: Colors.lightBlue),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LoginPage()),
                  );
                },
            ),
          ],
        ),
      ),
    );
  }
}
