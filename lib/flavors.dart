import 'package:flutter_config/flutter_config.dart';

enum Flavor {
  DEV,
  PROD,
}

class FlavorConfigs {
  static Flavor? appFlavor;

  static String get name => appFlavor?.name ?? '';

  static String get appName {
    final name = '${FlutterConfig.get('APP_NAME')}';
    switch (appFlavor) {
      case Flavor.PROD:
        return name;
      default:
        return '$name ${FlutterConfig.get('APP_ENVIRONMENT')}';
    }
  }
}
