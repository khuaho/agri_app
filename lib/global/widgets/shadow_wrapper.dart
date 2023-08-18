import 'package:flutter/material.dart';

class ShadowWrapper extends StatelessWidget {
  const ShadowWrapper({
    super.key,
    required this.child,
    this.margin,
    this.padding,
    this.borderRadius = 16,
    this.clipBehavior = Clip.none,
    this.backgroundColor,
  });

  final Widget child;

  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final double borderRadius;
  final Clip clipBehavior;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: padding,
      clipBehavior: clipBehavior,
      decoration: BoxDecoration(
        color: backgroundColor ?? Colors.white,
        borderRadius: BorderRadius.circular(borderRadius),
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(12, 26, 75, 0.1),
            blurRadius: 1,
          ),
          BoxShadow(
            color: Color.fromRGBO(20, 37, 63, 0.06),
            offset: Offset(0, 10),
            blurRadius: 16,
          )
        ],
      ),
      child: child,
    );
  }
}
