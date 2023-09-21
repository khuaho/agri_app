import 'shimmer_wrapper.dart';
import 'package:flutter/material.dart';

import '../../themes/app_colors.dart';

class ShimmerTile extends StatelessWidget {
  const ShimmerTile({
    super.key,
    this.height = 100,
  });

  final double? height;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: ShimmerWrapper(
        child: Container(
          height: height,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }
}
