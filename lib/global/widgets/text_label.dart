import 'package:flutter/material.dart';

class Textlabel extends StatelessWidget {
  const Textlabel({
    super.key,
    required this.label,
  });
  final String label;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.only(top: 12, bottom: 6),
      child: Text(
        label,
        style: textTheme.titleSmall,
      ),
    );
  }
}
