import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../../flavors.dart';

extension DotEnvExt on DotEnv {
  Future loadEnvVariables(Flavor flavor) async {
    switch (flavor) {
      case Flavor.dev:
        await dotenv.load(fileName: '.env.dev');
        break;
      case Flavor.prod:
        await dotenv.load(fileName: '.env.prod');
        break;
    }
  }
}
