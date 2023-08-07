import 'package:flutter/material.dart';

class ShimmerBox extends StatelessWidget {
  const ShimmerBox({
    Key? key,
    required this.height,
    required this.width,
    this.border = 4,
  }) : super(key: key);

  final double? height;
  final double? width;
  final double border;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(border),
      ),
    );
  }
}
