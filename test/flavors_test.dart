import 'package:agri_app/flavors.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Flavors Configs', () {
    test('DEV', () {
      FlutterConfig.loadValueForTesting({
        'APP_NAME': 'Agri',
        'APP_ENVIRONMENT': 'DEV',
      });
      FlavorConfigs.appFlavor = Flavor.DEV;
      expect(FlavorConfigs.name, 'DEV');
      expect(FlavorConfigs.appName, 'Agri DEV');
    });
  });

  test('PRODUCTION', () {
    FlutterConfig.loadValueForTesting({
      'APP_NAME': 'Agri',
      'APP_ENVIRONMENT': 'PROD',
    });
    FlavorConfigs.appFlavor = Flavor.PROD;
    expect(FlavorConfigs.name, 'PROD');
    expect(FlavorConfigs.appName, 'Agri');
  });
}
