import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../themes/app_colors.dart';

class ShimmerWrapper extends StatelessWidget {
  const ShimmerWrapper({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.neutral05,
      highlightColor: AppColors.neutral05,
      child: child,
    );
  }
}
