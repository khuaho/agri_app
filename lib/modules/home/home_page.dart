import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../global/themes/app_colors.dart';
import '../../global/utils/app_icons.dart';
import 'widgets/home_header.dart';
import 'widgets/weather_tile.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // final textTheme = Theme.of(context).textTheme;

    return const Scaffold(
      body: Stack(
        children: [
          HomeHeader(),
          Padding(
            padding: EdgeInsets.only(left: 16, right: 16, top: 160),
            child: Column(
              children: [
                Card(
                  color: AppColors.white,
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: WeatherTile(
                                title: '62 F',
                                subTitle: 'Temperature',
                                color: AppColors.successDefault,
                                icon: AppIcons.temperatire,
                              ),
                            ),
                            Expanded(
                              child: WeatherTile(
                                title: '61%',
                                subTitle: 'Humidity',
                                color: AppColors.information,
                                icon: AppIcons.droplet,
                              ),
                            ),
                          ],
                        ),
                        Divider(height: 30),
                        Row(
                          children: [
                            Expanded(
                              child: WeatherTile(
                                title: '0.0mm',
                                subTitle: 'Rainfall',
                                color: AppColors.pendingDefault,
                                icon: AppIcons.rain,
                              ),
                            ),
                            Expanded(
                              child: WeatherTile(
                                title: '3.9m/s',
                                subTitle: 'WindSpeed',
                                color: AppColors.alertDefault,
                                icon: AppIcons.cloud_wind,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
