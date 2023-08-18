import 'package:geolocator/geolocator.dart';

class GeolocatorService {
  const GeolocatorService._();

  static const String kLocationServicesDisabledMessage =
      'Location services are disabled.';
  static const String kPermissionDeniedMessage = 'Permission denied.';
  static const String kPermissionDeniedForeverMessage =
      'Permission denied forever.';
  static const String kPermissionGrantedMessage = 'Permission granted.';

  static final GeolocatorPlatform geolocatorPlatform =
      GeolocatorPlatform.instance;

  static Future<Position?> determinePosition() async {
    final hasPermission = await handlePermission();
    if (!hasPermission) {
      return Future.error('Location Not Available');
    }

    final position = await geolocatorPlatform.getCurrentPosition();
    return position;
  }

  static Future<bool> handlePermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await geolocatorPlatform.isLocationServiceEnabled();

    if (!serviceEnabled) {
      print(kLocationServicesDisabledMessage);
      return false;
    }

    permission = await geolocatorPlatform.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await geolocatorPlatform.requestPermission();
      if (permission == LocationPermission.denied) {
        print(kPermissionDeniedMessage);
        return false;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      print(kPermissionDeniedForeverMessage);
      return false;
    }
    print(kPermissionGrantedMessage);
    return true;
  }

  static Future<Position?> getLastKnownPosition() async {
    final position = await geolocatorPlatform.getLastKnownPosition();
    if (position != null) {
      return position;
    }
    return null;
  }
}
