import 'shimmer_wrapper.dart';
import 'package:flutter/material.dart';

import '../../themes/app_colors.dart';

class ShimmerTextField extends StatelessWidget {
  const ShimmerTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: ShimmerWrapper(
        child: Container(
          height: 48,
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
