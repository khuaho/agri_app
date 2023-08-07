import 'package:flutter/material.dart';

import '../themes/app_colors.dart';
import 'shimmer/shimmer_image.dart';

class Avatar extends StatelessWidget {
  const Avatar({
    Key? key,
    this.size = 40.0,
    this.imageUrl,
    this.name,
  }) : super(key: key);

  final double size;
  final String? imageUrl;
  final String? name;

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: size,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(1000),
        child: imageUrl != null
            ? ShimmerImage(
                imageUrl: imageUrl!,
                fit: BoxFit.cover,
              )
            : Container(
                color: AppColors.neutral05,
                alignment: Alignment.center,
                child: name != null && name!.length > 1
                    ? Text(
                        name?.substring(0, 1).toUpperCase() ?? '',
                        style: const TextStyle(
                          height: 1,
                          fontSize: 18,
                          color: AppColors.neutral02,
                          fontWeight: FontWeight.w700,
                        ),
                      )
                    : const Icon(
                        Icons.person_outline,
                      ),
              ),
      ),
    );
  }
}
