import 'package:weather/weather.dart';

import '../gen/strings.g.dart';
import 'constants.dart';

mixin AppMixin {
  WeatherFactory wf = WeatherFactory(
    Constants.weatherApiKey,
    language: LocaleSettings.currentLocale == AppLocale.en
        ? Language.ENGLISH
        : Language.VIETNAMESE,
  );
}
