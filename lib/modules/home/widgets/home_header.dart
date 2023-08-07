import 'package:flutter/material.dart';

import '../../../global/themes/app_colors.dart';
import '../../../global/widgets/avatar.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: const BoxDecoration(
        color: AppColors.successDefault,
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
                'Hello, Khua',
                style: textTheme.titleLarge?.copyWith(
                  color: AppColors.white,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'It is a sunny day!',
                style: textTheme.headlineSmall?.copyWith(
                  color: AppColors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const Avatar(
            name: 'khua',
          )
        ],
      ),
    );
  }
}
