import 'package:flutter/material.dart';
import 'package:newsapp/authencation/contactPage/screen/contact_page.dart';
import 'package:newsapp/authencation/defaultpage/widgets/login_button.dart';
import 'package:newsapp/authencation/defaultpage/widgets/signup_button.dart';
import 'package:newsapp/authencation/signuppage/screen/show_data_page.dart';

class MainLoginPage extends StatelessWidget {
  const MainLoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              'assets/login.png',
              height: 600,
              width: 600,
            ),
            // button for login
            LoginButton(),
            const SizedBox(
              height: 10,
            ),
            //Button for signup
            SignupButton(),

            const SizedBox(
              height: 25,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ShowDataPage()),
                );
              },
              child: const Text(
                "Continue as a guest?",
                style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w500
                    // decoration: TextDecoration.underline,
                    ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ContactPage()),
                );
              },
              child: const Text(
                "Contact Us",
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.w500
                        // decoration: TextDecoration.underline,
                        ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
