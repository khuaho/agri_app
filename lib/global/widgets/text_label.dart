import 'package:flutter/material.dart';

class Textlabel extends StatelessWidget {
  const Textlabel({
    super.key,
    required this.label,
    this.paddingTop = 12,
  });
  final String label;

  final double paddingTop;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: EdgeInsets.only(top: paddingTop, bottom: 6),
      child: Text(
        label,
        style: textTheme.titleSmall,
      ),
    );
  }
}
