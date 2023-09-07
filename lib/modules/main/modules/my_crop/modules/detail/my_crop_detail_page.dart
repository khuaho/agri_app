import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../../../../global/gen/strings.g.dart';
import '../../widgets/my_crop_overview.dart';

@RoutePage()
class MyCropDetailPage extends StatelessWidget {
  const MyCropDetailPage({
    super.key,
    required this.id,
  });

  final String id;

  @override
  Widget build(BuildContext context) {
    final transl = Translations.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(transl.myCropDetail.title),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          MyCropOverview(),
        ],
      ),
    );
  }
}
