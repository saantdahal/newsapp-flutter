import 'package:flutter/material.dart';
import 'package:newsapp/authencation/contactPage/widgets/contact_page_message.dart';

class ContactPage extends StatelessWidget {
  // Function to open email

  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Contact Us",
        ),
      ),
      body: ContactsPageMessage(),
    );
  }
}

