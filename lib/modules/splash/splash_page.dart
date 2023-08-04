import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../global/gen/strings.g.dart';

@RoutePage()
class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(t.appName),
      ),
    );
  }
}
