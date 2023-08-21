import 'package:flutter/material.dart';

import '../gen/assets.gen.dart';
import '../gen/strings.g.dart';

class EmptyData extends StatelessWidget {
  const EmptyData({super.key});

  @override
  Widget build(BuildContext context) {
    final transl = Translations.of(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Assets.images.noData.image(
          fit: BoxFit.contain,
          width: 250,
        ),
        Text(
          transl.common.dataNotFound,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
