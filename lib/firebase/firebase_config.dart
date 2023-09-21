import 'dart:convert';
import 'dart:math';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

late NotificationSettings settings;

class FirebaseConfig {
  static late AndroidNotificationChannel channel;
  static bool isFlutterLocalNotificationsInitialized = false;
  static late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
  static FirebaseMessaging messaging = FirebaseMessaging.instance;

  static Future<void> setupFlutterNotifications() async {
    try {
      settings = await requestPermission();
      if (settings.authorizationStatus == AuthorizationStatus.authorized) {
        FirebaseMessaging.onBackgroundMessage(
          FirebaseConfig.firebaseMessagingBackgroundHandler,
        );
      }
    } catch (exception) {
      print('exception: ${exception.toString()}');
    }
  }

  static Future<NotificationSettings> requestPermission() async {
    settings = await messaging.requestPermission(
      alert: true,
      badge: true,
      announcement: true,
      carPlay: true,
      criticalAlert: true,
      provisional: false,
      sound: true,
    );
    return settings;
  }

  @pragma('vm:entry-point')
  static Future<void> firebaseMessagingBackgroundHandler(
    RemoteMessage remoteMessage,
  ) async {
    await Firebase.initializeApp();
    await FirebaseConfig.initLocalNotifications();
    FirebaseConfig.showFlutterNotification(remoteMessage);
  }

  static Future<String?> getFirebaseMessagingToken() async {
    String? token = await messaging.getToken(
      vapidKey: '',
    );
    return token;
  }

  void isTokenFresh() async {
    messaging.onTokenRefresh.listen((event) {
      event.toString();
    });
  }

  static Future<void> initLocalNotifications() async {
    if (isFlutterLocalNotificationsInitialized) {
      return;
    }
    channel = AndroidNotificationChannel(
      Random.secure().nextInt(100000).toString(),
      'High Importance Notifications',
      description: 'This channel is used for important notifications.',
      importance: Importance.high,
    );

    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);

    await messaging.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
    isFlutterLocalNotificationsInitialized = true;
  }

  static void showFlutterNotification(RemoteMessage message) {
    RemoteNotification? notification = message.notification;
    Future.delayed(
      Duration.zero,
      () {
        flutterLocalNotificationsPlugin.show(
          notification.hashCode,
          notification?.title,
          notification?.body,
          NotificationDetails(
            iOS: const DarwinNotificationDetails(
              presentAlert: true,
              presentBadge: true,
              presentSound: true,
            ),
            android: AndroidNotificationDetails(
              channel.id,
              channel.name,
              channelDescription: channel.description,
              importance: Importance.high,
              priority: Priority.high,
              ticker: 'ticker',
              icon: '@drawable/ic_launcher',
            ),
          ),
          payload: jsonEncode(message.toMap()),
        );
      },
    );
  }

  static Future<void> localNotifications(
    BuildContext context,
    RemoteMessage message,
  ) async {
    var androidInitializationSettings =
        const AndroidInitializationSettings('@mipmap/ic_launcher');
    var iosInitializationSettings = const DarwinInitializationSettings();

    var initializationSetting = InitializationSettings(
      android: androidInitializationSettings,
      iOS: iosInitializationSettings,
    );

    await flutterLocalNotificationsPlugin.initialize(
      initializationSetting,
      onDidReceiveNotificationResponse: (payload) {
        print('hello');
        handleMessage(context, message);
      },
      onDidReceiveBackgroundNotificationResponse: (payload) {
        print('hello');
        handleMessage(context, message);
      },
    );
  }

  static Future<void> handleMessage(
    BuildContext context,
    RemoteMessage message,
  ) async {
    if (message.data.isNotEmpty && !kIsWeb) {
      final data = message.data;
      print('data: $data');
      print('Title: ${message.notification?.title}');
      print('Body: ${message.notification?.body}');

      // final notify = jsonDecode(data['notify']);
      // * Handle others Cases with "typeName";
      // _appRouter.push(HomeRoute(children: [
      //   RemotesRoute(
      //     children: [
      //       RemoteDetailsRoute(id: notify['remoteId']),
      //     ],
      //   ),
      // ]));
      // handleReadNotifications(data['notifyId'] as String);
    }
  }

  void sendNotification() {}
}
