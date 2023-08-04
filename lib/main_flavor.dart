import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:path_provider/path_provider.dart';

import 'app/app.dart';
import 'app/providers/app_dir_provider.dart';
import 'firebase_options.dart';
import 'flavors.dart';
import 'global/gen/strings.g.dart';
import 'global/utils/constants.dart';

void buildFlavor(Flavor flavor) async {
  F.appFlavor = flavor;
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Directory appDir = await getApplicationDocumentsDirectory();
  Directory appTempDir = await getTemporaryDirectory();
  await Hive.initFlutter();
  await Hive.openBox<String>(Constants.hiveDataBox);
  // await dotenv.loadEnvVariables(flavor);
  LocaleSettings.useDeviceLocale();

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
