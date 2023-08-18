import 'package:flutter/material.dart';

import '../../../../../global/themes/app_colors.dart';

class WeatherTile extends StatelessWidget {
  const WeatherTile({
    super.key,
    this.icon,
    this.color,
    required this.title,
    required this.subTitle,
  });

  final IconData? icon;
  final Color? color;
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Row(
      children: [
        Container(
          width: 45,
          height: 45,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color,
          ),
          child: Icon(
            icon,
            size: 20,
            color: AppColors.white,
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Text(
                subTitle,
                style: textTheme.bodySmall?.copyWith(
                  color: AppColors.neutral03,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
