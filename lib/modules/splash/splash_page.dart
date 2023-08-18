import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';

import '../../app/providers/app_settings_provider.dart';
import '../../global/app_router/app_router.dart';
import '../../global/gen/assets.gen.dart';
import '../../global/services/geolocator_service.dart';
import '../../global/themes/app_colors.dart';

@RoutePage()
class SplashPage extends ConsumerStatefulWidget {
  const SplashPage({super.key});

  @override
  ConsumerState<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends ConsumerState<SplashPage> {
  LocationSettings? locationSettings;
  StreamSubscription<Position>? positionStream;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      setLocationSettings();
      await getAndSaveCurrentPosition();
      final getAppSetting = ref.read(appSettingProvider);
      if (getAppSetting.isFirstLaunch && mounted) {
        context.router.replaceAll(
          [const OnboardingRoute()],
        );
      } else {
        context.router.replaceAll(
          [const MainRoute()],
        );
      }
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

  Future<void> getAndSaveCurrentPosition() async {
    Position? currentPosition = await GeolocatorService.determinePosition();
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Center(
        child: Assets.images.logo.image(
          width: 300,
          height: 300,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
