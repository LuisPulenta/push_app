import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotifications {
  static Future<void> requestPermissionLocalNotification() async {
    final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.requestPermission();
  }

  static Future<void> initializeLocalNotifications() async {
    final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

    const initializationSettingsAndroid =
        AndroidInitializationSettings('app_icon');

    const initializationSettings =
        InitializationSettings(android: initializationSettingsAndroid);

    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,

      //onDidReceiveBackgroundNotificationResponse: onDidReceiveBackgroundNotificationResponse
    );
  }

  static void showLocalNotification(
      {required int id, String? title, String? body, String? data}) async {
    const androidDetails = AndroidNotificationDetails(
      'channelId',
      'channelName',
      playSound: true,
      importance: Importance.high,
      priority: Priority.high,
    );

    const notificationDetails = NotificationDetails(
      android: androidDetails,
    );

    final flutterLocalNotificactionsPlugin = FlutterLocalNotificationsPlugin();
    flutterLocalNotificactionsPlugin.show(id, title, body, notificationDetails,
        payload: data);
  }
}
