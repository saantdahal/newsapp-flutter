import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotificationService {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  // Request notification permission
  Future<NotificationSettings> requestPermssion() async {
    return await _firebaseMessaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
  }

  // Get FCM Token
  Future<String?> getFcmToken() async {
    // Request notification permissions
    NotificationSettings settings = await requestPermssion();
    
    // Check if permission is granted
    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      final String? token = await _firebaseMessaging.getToken();
      if (token != null) {
        print('FCM Token: $token');  // Print FCM token
      } else {
        print('Failed to get FCM token');
      }
      return token;
    } else {
      print('Notification permissions not granted');
      return null;
    }
  }

  // Listen to foreground messages
  Future<void> foregroundMessaging() async {
    FirebaseMessaging.onMessage.listen(
      (RemoteMessage message) {
        if (message.notification != null) {
          print('Message also contained a notification: ${message.notification}');
        }
      },
    );
  }
}
