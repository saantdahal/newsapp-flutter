import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/authencation/loginpage/screen/login_page.dart';
import 'package:newsapp/authencation/loginpage/widgets/form_feild_email.dart';
import 'package:newsapp/authencation/loginpage/widgets/form_field_password.dart';
import 'package:newsapp/authencation/loginpage/widgets/icon_button_widgets.dart';
import 'package:newsapp/authencation/signuppage/widgets/password_form_field.dart';
import 'package:newsapp/authencation/signuppage/widgets/signup_bttn.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Hello! Register \nto get started',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 20),
              FormFieldForEmail(emailController: emailController),
              const SizedBox(height: 20),
              FormFieldPassword(passwordController: passwordController),
              const SizedBox(height: 20),
              PasswordFormField(
                  confirmPasswordController: confirmPasswordController,
                  passwordController: passwordController),
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
              const SizedBox(height: 5),
              SignupBttn(
                emailController: emailController,
                passwordController: passwordController,
                confirmPasswordController: confirmPasswordController,
              ),
              const SizedBox(height: 10),
              const Center(
                child: Text('Or Signup with'),
              ),
              const SizedBox(height: 40),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButtonWidgets(image: 'assets/facebookLogo.png'),
                  SizedBox(width: 20),
                  IconButtonWidgets(image: 'assets/googleLogo.png'),
                  SizedBox(width: 20),
                  IconButtonWidgets(image: 'assets/appleLogo.png'),
                ],
              ),
              const SizedBox(height: 20),
              Center(
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
