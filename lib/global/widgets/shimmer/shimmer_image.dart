import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'shimmer_wrapper.dart';

class ShimmerImage extends StatelessWidget {
  const ShimmerImage({
    super.key,
    required this.imageUrl,
    this.iconErrorSize = 20,
    this.fit = BoxFit.cover,
    this.width,
    this.height,
    this.errorWidget,
  });

  final String imageUrl;
  final double? width;
  final double? height;
  final double iconErrorSize;
  final BoxFit fit;
  final Widget? errorWidget;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      width: width,
      height: height,
      fit: fit,
      placeholder: (context, url) => ShimmerWrapper(
        child: SizedBox(height: width, width: height),
      ),
      errorWidget: (context, url, error) =>
          errorWidget ??
          Icon(
            Icons.error,
            size: iconErrorSize,
          ),
    );
  }
}
