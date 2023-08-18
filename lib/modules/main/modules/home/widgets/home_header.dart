import 'package:flutter/material.dart';
import 'package:weather/weather.dart';

import '../../../../../global/gen/strings.g.dart';
import '../../../../../global/themes/app_colors.dart';
import '../../../../../global/widgets/avatar.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key, this.weather});

  final Weather? weather;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final transl = Translations.of(context);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: const BoxDecoration(
        color: AppColors.primary,
      ),
      height: MediaQuery.of(context).size.height * 0.25,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                transl.home.hello.you,
                style: textTheme.titleLarge?.copyWith(
                  color: AppColors.white,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                transl.home
                    .weatherDes(value: weather?.weatherDescription ?? ''),
                style: textTheme.headlineSmall?.copyWith(
                  color: AppColors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Avatar(name: 'Khua'),
              const SizedBox(height: 6),
              Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: AppColors.alertSoft,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.location_searching,
                      size: 16,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      weather?.areaName ?? '',
                      style: textTheme.titleSmall,
                    )
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}