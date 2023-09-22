import 'dart:async';
import 'dart:convert';

import 'package:app_settings/app_settings.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';

import '../firebase/firebase_config.dart';
import '../global/data/models/app_event/app_event.dart';
import '../global/data/models/installation/installation.dart';
import '../global/data/models/notification/notification.dart';
import '../global/utils/app_mixin.dart';
import '../global/utils/device_info.dart';
import 'providers/app_settings_provider.dart';
import 'package:flutter/material.dart' hide Notification;
// ignore: depend_on_referenced_packages
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../flavors.dart';
import '../global/app_router/app_router.dart';
import '../global/extensions/app_locale_ext.dart';
import '../global/gen/strings.g.dart';
import '../global/themes/app_themes.dart';
import 'providers/installation_provider.dart';
import 'providers/noti_provider.dart';

class MyApp extends ConsumerStatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp>
    with WidgetsBindingObserver, AppMixin {
  final appRouter = AppRouter();
  late StreamSubscription userChangeSub;

  @override
  void initState() {
    initLocale();
    initFirebaseMessaging();
    userChangeSub =
        FirebaseAuth.instance.authStateChanges().listen((firebaseUser) {
      final currentUser = FirebaseAuth.instance.currentUser;
      if (currentUser != null) {
        handleUpsertInstallation();
      }
    });
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
        final currentUser = FirebaseAuth.instance.currentUser;
        if (currentUser != null) {
          handleUpsertInstallation();
        }
        break;
      default:
    }
  }

  @override
  void dispose() {
    userChangeSub.cancel();
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
      if (!kIsWeb) {
        await FirebaseConfig.initLocalNotifications();
      }

      final token = await FirebaseConfig.getFirebaseMessagingToken();
      print('token: $token');

      FirebaseMessaging.onMessage.listen((RemoteMessage message) {
        eventBus.fire(const UpsertNotificationEvent());
        // FirebaseConfig.showFlutterNotification(message);
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
      final notification = Notification.fromJson(jsonDecode(data['notify']));
      await handleReadNotifications(notification);
      appRouter.push(
        const MainRoute(
          children: [
            CropsRoute(),
          ],
        ),
      );
    }
  }

  void handleUpsertInstallation() async {
    final settingFirebase = await FirebaseConfig.requestPermission();
    if (settingFirebase.authorizationStatus == AuthorizationStatus.authorized) {
      final deviceToken = await FirebaseConfig.getFirebaseMessagingToken();
      final deviceId = await DeviceInfoHelper.getDeviceId();
      final osName = await DeviceInfoHelper.getOSName();
      final osVersion = await DeviceInfoHelper.getOSVersion();

      final installationReq = ref.read(installationProvider.notifier);

      final request = Installation(
        deviceId: deviceId,
        token: deviceToken,
        version: osVersion,
        os: osName,
      );
      installationReq.upsertInstallation(request);
    }
  }

  Future<void> handleReadNotifications(Notification notify) async {
    final notiProvider = ref.read(notificationProvider.notifier);
    await notiProvider.upsertNotification(notify.copyWith(isRead: true));
  }
}
