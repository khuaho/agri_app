import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';

import '../../app/providers/app_settings_provider.dart';
import '../../global/app_router/app_router.dart';
import '../../global/services/geolocator_service.dart';
import '../../global/themes/app_colors.dart';

@RoutePage()
class MainPage extends ConsumerStatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  ConsumerState<MainPage> createState() => _MainPageState();
}

class _MainPageState extends ConsumerState<MainPage> {
  TabsRouter? tabsRouter;
  LocationSettings? locationSettings;
  StreamSubscription<Position>? positionStream;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      setLocationSettings();
      await getAndSaveCurrentPosition();
    });
    positionStream =
        Geolocator.getPositionStream(locationSettings: locationSettings)
            .listen((Position? position) {
      final appSettingsPro = ref.read(appSettingProvider.notifier);
      if (position != null) {
        appSettingsPro.saveCurrentPosition(position);
      }
    });
  }

  // @override
  // void dispose() {
  //   super.dispose();
  // }

  Future<void> getAndSaveCurrentPosition() async {
    Position? currentPosition =
        await GeolocatorService.determinePosition(context);
    final appSettingsPro = ref.read(appSettingProvider.notifier);
    if (currentPosition != null) {
      appSettingsPro.saveCurrentPosition(currentPosition);
    }
  }

  void setLocationSettings() {
    if (defaultTargetPlatform == TargetPlatform.android) {
      locationSettings = AndroidSettings(
        accuracy: LocationAccuracy.high,
        distanceFilter: 100,
        forceLocationManager: true,
        intervalDuration: const Duration(seconds: 10),
        //(Optional) Set foreground notification config to keep the app alive
        //when going to the background
        foregroundNotificationConfig: const ForegroundNotificationConfig(
          notificationText:
              "Example app will continue to receive your location even when you aren't using it",
          notificationTitle: 'Running in Background',
          enableWakeLock: true,
        ),
      );
    } else if (defaultTargetPlatform == TargetPlatform.iOS ||
        defaultTargetPlatform == TargetPlatform.macOS) {
      locationSettings = AppleSettings(
        accuracy: LocationAccuracy.high,
        activityType: ActivityType.fitness,
        distanceFilter: 100,
        pauseLocationUpdatesAutomatically: true,
        // Only set to true if our app will be started up in the background.
        showBackgroundLocationIndicator: false,
      );
    } else {
      locationSettings = const LocationSettings(
        accuracy: LocationAccuracy.high,
        distanceFilter: 100,
      );
    }
  }

  final routes = [
    const HomeRoute(),
    const CropsRoute(),
    const SettingsRoute(),
  ];

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: routes,
      transitionBuilder: (context, child, animation) => FadeTransition(
        opacity: animation,
        child: child,
      ),
      builder: (context, child) {
        tabsRouter = AutoTabsRouter.of(context);

        return Scaffold(
          body: child,
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: tabsRouter!.activeIndex,
            onTap: (index) {
              tabsRouter!.setActiveIndex(index);
            },
            selectedItemColor: AppColors.primary,
            showUnselectedLabels: true,
            type: BottomNavigationBarType.fixed,
            items: const [
              BottomNavigationBarItem(
                label: 'Home',
                icon: Icon(Icons.home_outlined),
                activeIcon: Icon(Icons.home),
              ),
              BottomNavigationBarItem(
                label: 'Crops',
                icon: Icon(Icons.local_florist),
                activeIcon: Icon(Icons.local_florist),
              ),
              BottomNavigationBarItem(
                label: 'Setting',
                icon: Icon(Icons.settings_outlined),
                activeIcon: Icon(Icons.settings),
              ),
            ],
          ),
        );
      },
    );
  }
}
