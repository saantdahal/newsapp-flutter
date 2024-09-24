import 'package:flutter/material.dart';
import 'package:newsapp/authencation/contactPage/widgets/contact_medium.dart';

class ContactsPageMessage extends StatelessWidget {
  const ContactsPageMessage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        ContactMedium(),
        const SizedBox(
          height: 20,
        ),
        Container(
          height: 200,
          width: 200,
          decoration: const BoxDecoration(shape: BoxShape.rectangle),
          child: const Text(
            "If you have \nany query please contact \nus for any information !",
            style: TextStyle(
                color: Colors.orange,
                fontWeight: FontWeight.w600,
                fontSize: 20),
          ),
        )
      ],
    );
  }
}

