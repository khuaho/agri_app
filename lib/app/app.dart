import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:permission_handler/permission_handler.dart';

import '../flavors.dart';
import '../global/app_router/app_router.dart';
import '../global/gen/strings.g.dart';
import '../global/services/geolocator_service.dart';
import '../global/themes/app_themes.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  final appRouter = AppRouter();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    super.didChangeAppLifecycleState(state);

    switch (state) {
      case AppLifecycleState.resumed:
        print('resumed');
        if (await Permission.location.serviceStatus.isDisabled) {
          if (!mounted) return;
          await GeolocatorService.checkPermission(context);
        }
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: F.title,
      debugShowCheckedModeBanner: false,
      // routerDelegate: appRouter.delegate(),
      // routeInformationParser: appRouter.defaultRouteParser(),
      routerConfig: appRouter.config(),
      locale: TranslationProvider.of(context).flutterLocale, // use provider
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

  // Future<void> initPlatformState() async {
  //   ////
  //   // 1.  Listen to events (See docs for all 12 available events).
  //   //

  //   // Fired whenever a location is recorded
  //   bg.BackgroundGeolocation.onLocation((bg.Location location) {
  //     print('[location] - $location');
  //   });

  //   // Fired whenever the plugin changes motion-state (stationary->moving and vice-versa)
  //   bg.BackgroundGeolocation.onMotionChange((bg.Location location) {
  //     print('[motionchange] - $location');
  //   });

  //   // Fired whenever the state of location-services changes.  Always fired at boot
  //   bg.BackgroundGeolocation.onProviderChange((bg.ProviderChangeEvent event) {
  //     print('[providerchange] - $event');
  //   });

  //   ////
  //   // 2.  Configure the plugin
  //   //
  //   bg.BackgroundGeolocation.ready(
  //     bg.Config(
  //       desiredAccuracy: bg.Config.DESIRED_ACCURACY_HIGH,
  //       distanceFilter: 10.0,
  //       stopOnTerminate: false,
  //       startOnBoot: true,
  //       debug: true,
  //       logLevel: bg.Config.LOG_LEVEL_VERBOSE,
  //     ),
  //   ).then((bg.State state) {
  //     if (!state.enabled) {
  //       ////
  //       // 3.  Start the plugin.
  //       //
  //       bg.BackgroundGeolocation.start();
  //     }
  //   });
  // }
}
