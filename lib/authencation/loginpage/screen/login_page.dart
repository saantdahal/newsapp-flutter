import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/authencation/loginpage/widgets/form_feild_email.dart';
import 'package:newsapp/authencation/loginpage/widgets/form_field_password.dart';
import 'package:newsapp/authencation/loginpage/widgets/handle_loginbutton_press.dart';
import 'package:newsapp/authencation/loginpage/widgets/icon_button_widgets.dart';
import 'package:newsapp/authencation/signuppage/screen/signup_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Welcome back! Glad to \nsee you, Again!',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 50),
              FormFieldForEmail(emailController: emailController),
              const SizedBox(height: 20),
              FormFieldPassword(passwordController: passwordController),
              const SizedBox(height: 10),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    // Handle forgot password
                  },
                  child: const Text(
                    'Forgot Password?',
                    style: TextStyle(
                      color: Colors.black54,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              LoginButtonPress(formKey: formKey, emailController: emailController, passwordController: passwordController),
              const SizedBox(height: 20),
              const Center(
                child: Text('Or Login with'),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  SizedBox(
                    height: 10,
                  ),
                  IconButtonWidgets(image: 'assets/facebookLogo.png'),
                  SizedBox(
                    width: 20,
                  ),
                  IconButtonWidgets(image: 'assets/googleLogo.png'),
                  SizedBox(
                    width: 20,
                  ),
                  IconButtonWidgets(image: 'assets/appleLogo.png'),
                ],
              ),
              const Spacer(),
              Center(
                child: RichText(
                  text: TextSpan(
                    text: "Don't have an account? ",
                    style: const TextStyle(color: Colors.black),
                    children: [
                      TextSpan(
                        text: 'Register Now',
                        style: const TextStyle(color: Colors.lightBlue),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SignupPage()),
                            );
                          },
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}




