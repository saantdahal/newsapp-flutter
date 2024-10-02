import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotificationService {
  static final FlutterLocalNotificationsPlugin _notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static void initalizeLocalNotification(RemoteMessage message) async {
    const androidNotificationDetails = AndroidNotificationDetails(
      "channelId",
      "channelName",
      importance: Importance.max,
      icon: "@mipmap/ic_launcher",
    );

    const notificationDetails =
        NotificationDetails(android: androidNotificationDetails);

    const initSettings = InitializationSettings(
      android: AndroidInitializationSettings("@mipmap/ic_launcher"),
    );
    await _notificationsPlugin.initialize(initSettings);
    await _notificationsPlugin.show(
      1,
      message.notification?.title,
      message.notification?.body,
      notificationDetails,
      // payload: message.data['route'],
    );
  }
}
