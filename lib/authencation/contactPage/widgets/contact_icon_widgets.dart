import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactButtonWidgets extends StatelessWidget {
  const ContactButtonWidgets({
    super.key,
    this.paramater,
    this.iconDetails,
  });
  final String? paramater;
  final Icon? iconDetails;
  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon: iconDetails ?? const Icon(Icons.help),
        onPressed: () {
          launchUrl(Uri.parse(paramater ?? ""),
              mode: LaunchMode.externalApplication);
        });
  }
}
