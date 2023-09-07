import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../app/providers/app_settings_provider.dart';
import '../../global/app_router/app_router.dart';
import '../../global/gen/assets.gen.dart';
import '../../global/themes/app_colors.dart';

@RoutePage()
class SplashPage extends ConsumerStatefulWidget {
  const SplashPage({super.key});

  @override
  ConsumerState<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends ConsumerState<SplashPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Future.delayed(const Duration(seconds: 1));
      final getAppSetting = ref.read(appSettingProvider);
      if (getAppSetting.isFirstLaunch && mounted) {
        context.router.replaceAll(
          [const OnboardingRoute()],
        );
      } else {
        context.router.replaceAll(
          [const MainRoute()],
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Center(
        child: Assets.images.logo.image(
          width: 300,
          height: 300,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
