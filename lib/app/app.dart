import 'package:app_settings/app_settings.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';

import '../firebase/firebase_config.dart';
import 'providers/app_settings_provider.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../flavors.dart';
import '../global/app_router/app_router.dart';
import '../global/extensions/app_locale_ext.dart';
import '../global/gen/strings.g.dart';
import '../global/themes/app_themes.dart';

class MyApp extends ConsumerStatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> with WidgetsBindingObserver {
  final appRouter = AppRouter();

  @override
  void initState() {
    initLocale();
    initFirebaseMessaging();
    super.initState();
  }

  void initLocale() {
    final appSettingsController = ref.read(appSettingProvider.notifier);
    final currentLocale = ref.read(appSettingProvider).locale;
    appSettingsController.changeLocale(currentLocale);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    switch (state) {
      case AppLifecycleState.resumed:
        print('resumed');
        break;
      default:
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: F.title,
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter.config(),
      locale: ref.watch(appSettingProvider).locale.toLocale(),
      supportedLocales: AppLocaleUtils.supportedLocales,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      theme: AppThemes.light(),
      builder: (context, child) => MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
        child: child ?? const SizedBox(),
      ),
    );
  }

  void initFirebaseMessaging() async {
    final settingFirebase = await FirebaseConfig.requestPermission();
    if (settingFirebase.authorizationStatus == AuthorizationStatus.authorized) {
      // final token = await FirebaseConfig.getFirebaseMessagingToken();
      // print('token: $token');

      if (!kIsWeb) {
        await FirebaseConfig.initLocalNotifications();
      }

      FirebaseMessaging.onMessage.listen((RemoteMessage message) {
        RemoteNotification? notification = message.notification;
        print('data: ${message.data}');
        print(notification?.title);
        print(notification?.body);
        // if (Platform.isAndroid) {
        //   // FirebaseConfig.localNotifications(context, message);
        //   FirebaseConfig.showFlutterNotification(message);
        // } else {
        FirebaseConfig.showFlutterNotification(message);
        // }
      });

      FirebaseMessaging.onBackgroundMessage(
        handleNotifyOnBackgroundAndQuitApp,
      );

      // handle message open app when app is running in background
      FirebaseMessaging.onMessageOpenedApp.listen(
        handleNotifyOnBackgroundAndQuitApp,
      );

      // handle message open app when app terminated
      FirebaseMessaging.instance
          .getInitialMessage()
          .then((RemoteMessage? remoteMessage) {
        if (remoteMessage != null) {
          print('hello');
          handleNotifyOnBackgroundAndQuitApp(remoteMessage);
        }
      });
    } else if (settingFirebase.authorizationStatus ==
        AuthorizationStatus.provisional) {
      debugPrint('User granted provisional permission');
    } else {
      debugPrint('User declined or has not accepted permission');
      AppSettings.openAppSettings(type: AppSettingsType.notification);
    }
  }

  Future<void> handleNotifyOnBackgroundAndQuitApp(RemoteMessage message) async {
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
}
