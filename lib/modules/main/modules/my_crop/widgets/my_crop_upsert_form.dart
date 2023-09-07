import 'package:flutter/material.dart';

import '../../../../../global/data/models/my_crop/my_crop.dart';

class MyCropUpsertForm extends StatelessWidget {
  const MyCropUpsertForm({super.key, this.initial});

  final MyCrop? initial;

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text('data'),
      ],
    );
  }
}
