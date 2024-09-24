import 'package:flutter/material.dart';
import 'package:newsapp/authencation/contactPage/widgets/contact_icon_widgets.dart';

class ContactMedium extends StatelessWidget {
  const ContactMedium({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        ContactButtonWidgets(
          paramater: 'mailto:abc@gmail.com',
          iconDetails: Icon(Icons.mail),
        ),
        Spacer(),
        ContactButtonWidgets(
          paramater: 'tel:9840552514',
          iconDetails: Icon(Icons.phone),
        ),
        Spacer(),
        ContactButtonWidgets(
          paramater: 'https://google.com',
          iconDetails: Icon(Icons.browser_updated_sharp),
        ),
      ],
    );
  }
}
