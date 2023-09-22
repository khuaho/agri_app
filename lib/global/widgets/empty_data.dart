import 'package:flutter/material.dart';

import '../gen/assets.gen.dart';
import '../gen/strings.g.dart';

class EmptyData extends StatelessWidget {
  const EmptyData({super.key, this.onTap});

  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final transl = Translations.of(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
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
        if (onTap != null)
          Padding(
            padding: const EdgeInsets.only(top: 6),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                fixedSize: const Size(double.infinity, 20),
              ),
              onPressed: () {
                if (onTap != null) {
                  onTap!();
                }
              },
              child: Text(
                transl.common.loadData,
                style: const TextStyle(fontSize: 14),
              ),
            ),
          )
      ],
    );
  }
}
