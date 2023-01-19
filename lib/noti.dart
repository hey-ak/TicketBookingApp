import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class Noti {
  static Future initialize(
      FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin) async {
    var androidInitialize =
        AndroidInitializationSettings('mipmap/ic_launcher');
    var iOSInitialize = IOSInitializationSettings();
    var initializationSettings = InitializationSettings(
        android: androidInitialize, iOS: iOSInitialize);
    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  static Future showBigTextNotification(
      {required FlutterLocalNotificationsPlugin fln}) async {
    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
      'you_can_name_it_whatever1',
      'channel_name',
      playSound: true,
      importance: Importance.max,
      priority: Priority.high,
    );

    var platformChannelSpecifics = NotificationDetails(
        android: androidPlatformChannelSpecifics,
        iOS: IOSNotificationDetails());
    await fln.show(1, 'Ticket Booked', 'Succesfully Booked', platformChannelSpecifics,
        payload: 'Default_Sound');
  }
}
