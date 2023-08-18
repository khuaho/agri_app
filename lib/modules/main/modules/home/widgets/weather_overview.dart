import 'package:flutter/material.dart';
import 'package:weather/weather.dart';

import '../../../../../global/extensions/double_ext.dart';
import '../../../../../global/gen/strings.g.dart';
import '../../../../../global/themes/app_colors.dart';
import '../../../../../global/utils/app_icons.dart';
import 'weather_tile.dart';

class WeatherOverview extends StatelessWidget {
  const WeatherOverview({
    super.key,
    required this.weather,
  });

  final Weather? weather;

  @override
  Widget build(BuildContext context) {
    final transl = Translations.of(context);

    return Card(
      color: AppColors.white,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: WeatherTile(
                    title: transl.home.temperature.value(
                      value: (weather?.temperature?.fahrenheit ?? 0.0)
                          .toStringLimitFractionDigits(),
                    ),
                    subTitle: transl.home.temperature.label,
                    color: AppColors.successDefault,
                    icon: AppIcons.temperatire,
                  ),
                ),
                Expanded(
                  child: WeatherTile(
                    title: transl.home.humidity.value(
                      value: (weather?.humidity ?? 0)
                          .toStringLimitFractionDigits(),
                    ),
                    subTitle: transl.home.humidity.label,
                    color: AppColors.information,
                    icon: AppIcons.droplet,
                  ),
                ),
              ],
            ),
            const Divider(height: 30),
            Row(
              children: [
                Expanded(
                  child: WeatherTile(
                    title: transl.home.rainfall
                        .value(value: weather?.rainLast3Hours ?? 0.0),
                    subTitle: transl.home.rainfall.label,
                    color: AppColors.pendingDefault,
                    icon: AppIcons.rain,
                  ),
                ),
                Expanded(
                  child: WeatherTile(
                    title: transl.home.windSpeed.value(
                      value: weather?.windSpeed ?? 0.0,
                    ),
                    subTitle: transl.home.windSpeed.label,
                    color: AppColors.alertDefault,
                    icon: AppIcons.cloud_wind,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
