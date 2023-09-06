import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather/weather.dart';

import '../../../../app/providers/app_settings_provider.dart';
import '../../../../global/app_router/app_router.dart';
import '../../../../global/utils/app_mixin.dart';
import 'widgets/home_header.dart';
import 'widgets/weather_overview.dart';

@RoutePage()
class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> with AppMixin {
  Weather? weather;

  @override
  void initState() {
    super.initState();
    currentWeather();
  }

  Future<void> currentWeather() async {
    final getAppSetting = ref.read(appSettingProvider);
    final w = await wf.currentWeatherByLocation(
      getAppSetting.lat,
      getAppSetting.lon,
    );
    setState(() {
      weather = w;
    });
  }

  @override
  Widget build(BuildContext context) {
    // final textTheme = Theme.of(context).textTheme;
    // final transl = Translations.of(context);

    return Scaffold(
      body: Stack(
        children: [
          HomeHeader(weather: weather),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 160),
            child: Column(
              children: [
                WeatherOverview(weather: weather),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    context.pushRoute(const LocationRoute());
                  },
                  child: const Text('Location page'),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
