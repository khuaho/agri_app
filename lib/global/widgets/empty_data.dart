import 'package:flutter/material.dart';

import '../gen/assets.gen.dart';
import '../gen/strings.g.dart';

class EmptyData extends StatelessWidget {
  const EmptyData({super.key});

  @override
  Widget build(BuildContext context) {
    final transl = Translations.of(context);
    return ListView(
      primary: false,
      children: [
        Assets.images.noData.image(
          fit: BoxFit.contain,
          height: 160,
        ),
        Center(
          child: Text(
            transl.common.dataNotFound,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
