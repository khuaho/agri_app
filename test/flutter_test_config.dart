import 'dart:async';
import 'dart:io';
import 'package:agri_app/firebase/firebase_config.dart';
import 'package:agri_app/global/gen/strings.g.dart';
import 'package:agri_app/global/utils/constants.dart';
import 'package:agri_app/locator.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mocktail/mocktail.dart';

import 'package:agri_app/flavors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:path_provider_platform_interface/path_provider_platform_interface.dart';

import 'mocks/fake_path_provider.dart';
import 'mocks/_mocks.dart';

Future<void> testExecutable(FutureOr<void> Function() testMain) async {
  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    FlavorConfigs.appFlavor = Flavor.PROD;
    FlutterConfig.loadValueForTesting({
      'APP_NAME': 'Agri',
      'APP_ENVIRONMENT': 'PROD',
    });
    PathProviderPlatform.instance = FakePathProviderPlatform();
    registerFallbackValue(MockFirebaseApp());

    // await Firebase.initializeApp(
    //   options: DefaultFirebaseOptions.currentPlatform,
    // );
    await Hive.initFlutter(testMain.hashCode.toString());
    await Hive.openBox<String>(Constants.hiveDataBox);
    await setupLocator();
    LocaleSettings.useDeviceLocale();
    FirebaseConfig.setupFlutterNotifications();
    registerFallbackValue(FakeRoute());
  });

  tearDownAll(() async {
    final dir = File('$kApplicationDocumentsPath/${testMain.hashCode}');
    await dir.delete(recursive: true);
  });

  await testMain();
}

void ignoreOverflowErrors(
  FlutterErrorDetails details, {
  bool forceReport = false,
}) {
  bool ifIsOverflowError = false;
  bool isUnableToLoadAsset = false;

  // Detect overflow error.
  var exception = details.exception;
  if (exception is FlutterError) {
    ifIsOverflowError = !exception.diagnostics.any(
      (e) => e.value.toString().startsWith('A RenderFlex overflowed by'),
    );
    isUnableToLoadAsset = !exception.diagnostics.any(
      (e) => e.value.toString().startsWith('Unable to load asset'),
    );
  }

  // Ignore if is overflow error.
  if (ifIsOverflowError || isUnableToLoadAsset) {
    debugPrint('Ignored Error');
  } else {
    FlutterError.dumpErrorToConsole(details, forceReport: forceReport);
  }
}
