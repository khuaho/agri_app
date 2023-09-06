import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart';

import 'app/app.dart';
import 'app/providers/app_dir_provider.dart';
import 'flavors.dart';
import 'global/gen/strings.g.dart';
import 'locator.dart';

void buildFlavor(Flavor flavor) async {
  F.appFlavor = flavor;
  WidgetsFlutterBinding.ensureInitialized();
  Directory appDir = await getApplicationDocumentsDirectory();
  Directory appTempDir = await getTemporaryDirectory();
  await setupLocator();
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
