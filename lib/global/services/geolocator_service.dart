import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

import '../gen/strings.g.dart';
import '../widgets/confirmation_dialog.dart';

class GeolocatorService {
  const GeolocatorService._();

  static final GeolocatorPlatform geolocatorPlatform =
      GeolocatorPlatform.instance;

  static void showOpenSettingsDialog(
    BuildContext context,
    String contentMsg,
  ) {
    final transl = Translations.of(context);

    showDialog(
      context: context,
      builder: (dialogContext) => ConfirmationDialog(
        titleText: transl.common.oops,
        contentText: contentMsg,
        positiveButtonText: transl.common.button.openSettings,
        onTapPositiveButton: () async {
          if (await Geolocator.openLocationSettings()) {
            if (context.mounted) {
              Navigator.of(context).pop();
            }
          }
        },
        onTapNegativeButton: Navigator.of(context).pop,
      ),
    );
  }

  static Future<Position?> determinePosition(BuildContext context) async {
    await checkPermission(context);
    final position = await geolocatorPlatform.getCurrentPosition();
    return position;
  }

  static Future<void> checkPermission(BuildContext context) async {
    final transl = Translations.of(context);
    final hasPermission = await handlePermission(context);
    if (!hasPermission) {
      if (context.mounted) {
        showOpenSettingsDialog(
          context,
          transl.common.permission_.locationNotAvailable,
        );
      }
      return Future.error(transl.common.permission_.locationNotAvailable);
    }
  }

  static Future<bool> handlePermission(BuildContext context) async {
    final transl = Translations.of(context);
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await geolocatorPlatform.isLocationServiceEnabled();
    if (!serviceEnabled) {
      print(transl.common.permission_.locationServicesAreDisabled);
      return false;
    }

    permission = await geolocatorPlatform.checkPermission();
    switch (permission) {
      case LocationPermission.denied:
        permission = await geolocatorPlatform.requestPermission();
        if (permission == LocationPermission.denied) {
          print(transl.common.permission_.permissionDenied);
        }
        return false;
      case LocationPermission.deniedForever:
        print(transl.common.permission_.permissionDeniedForever);
        return false;
      case LocationPermission.unableToDetermine:
        print(transl.common.permission_.unableToDetermine);
        return false;
      case LocationPermission.always:
      case LocationPermission.whileInUse:
        print(transl.common.permission_.permissionGranted);
        return true;
    }
  }

  static Future<Position?> getLastKnownPosition() async {
    final position = await geolocatorPlatform.getLastKnownPosition();
    if (position != null) {
      return position;
    }
    return null;
  }
}
