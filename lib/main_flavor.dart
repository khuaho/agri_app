import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

import 'app/app.dart';
import 'app/providers/app_dir_provider.dart';
import 'firebase/firebase_config.dart';
import 'firebase/firebase_options.dart';
import 'flavors.dart';
import 'global/gen/strings.g.dart';
import 'global/utils/constants.dart';
import 'locator.dart';

void buildFlavor(Flavor flavor) async {
  FlavorConfigs.appFlavor = flavor;
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterConfig.loadEnvVariables();
  Directory appDir = await getApplicationDocumentsDirectory();
  Directory appTempDir = await getTemporaryDirectory();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Hive.initFlutter();
  await Hive.openBox<String>(Constants.hiveDataBox);
  await setupLocator();

  LocaleSettings.useDeviceLocale();
  FirebaseConfig.setupFlutterNotifications();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then(
    (value) => runApp(
      ProviderScope(
        overrides: [
          appDirProvider.overrideWithValue(appDir),
          appTempDirProvider.overrideWithValue(appTempDir),
        ],
        child: TranslationProvider(
          child: const MyApp(),
        ),
      ),
    ),
  );
}
