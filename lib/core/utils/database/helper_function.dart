import 'package:url_launcher/url_launcher.dart';

void makePhoneCall(int phoneNum) async {
  final Uri uri = Uri(scheme: "tel", path: phoneNum.toString());
  await launchUrl(uri);
}

void makeSms(int phoneNum) async {
  final Uri uri = Uri(scheme: "sms", path: phoneNum.toString());
  await launchUrl(uri);
}
