// Minimal stubs to satisfy analyzer when firebase_messaging and flutter_local_notifications
// are not available in the environment. These are NOT functional implementations.

import 'dart:async';

class RemoteNotification {
  final String? title;
  final String? body;
  RemoteNotification({this.title, this.body});
}

class RemoteMessage {
  final String? messageId;
  final Map<String, dynamic> data;
  final RemoteNotification? notification;
  RemoteMessage({this.messageId, this.data = const {}, this.notification});
}

class NotificationSettings {
  final String authorizationStatus;
  NotificationSettings(this.authorizationStatus);
}

class FirebaseMessaging {
  FirebaseMessaging._internal();
  static final FirebaseMessaging instance = FirebaseMessaging._internal();

  static Stream<RemoteMessage> get onMessage => Stream<RemoteMessage>.empty();
  static Stream<RemoteMessage> get onMessageOpenedApp => Stream<RemoteMessage>.empty();

  Future<NotificationSettings> requestPermission({bool alert = true, bool badge = true, bool sound = true, bool provisional = false}) async {
    return NotificationSettings('authorized');
  }

  Future<void> subscribeToTopic(String topic) async {}
  Future<void> unsubscribeFromTopic(String topic) async {}
  Future<String?> getToken() async => null;

  static Future<void> onBackgroundMessage(Future<void> Function(RemoteMessage) handler) async {}
}

class FlutterLocalNotificationsPlugin {
  Future<void> initialize(Object settings, {void Function(NotificationResponse)? onDidReceiveNotificationResponse}) async {}
  Future<void> show(int id, String? title, String? body, Object? details, {String? payload}) async {}
}

class NotificationResponse {
  final String? payload;
  NotificationResponse({this.payload});
}

class AndroidInitializationSettings {
  final String icon;
  const AndroidInitializationSettings(this.icon);
}

class DarwinInitializationSettings {
  const DarwinInitializationSettings();
}

class InitializationSettings {
  final Object? android;
  final Object? iOS;
  const InitializationSettings({this.android, this.iOS});
}

class AndroidNotificationDetails {
  final String id;
  final String name;
  final String? channelDescription;
  final Object importance;
  final Object priority;
  const AndroidNotificationDetails(this.id, this.name, {this.channelDescription, required this.importance, required this.priority});
}

class DarwinNotificationDetails {
  const DarwinNotificationDetails();
}

class NotificationDetails {
  final Object? android;
  final Object? iOS;
  const NotificationDetails({this.android, this.iOS});
}

class Importance {
  static final high = Importance();
}

class Priority {
  static final high = Priority();
}
