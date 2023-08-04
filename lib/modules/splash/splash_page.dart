import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
  // @override
  // void initState() async {
  //   super.initState();
  //   WidgetsBinding.instance.addPostFrameCallback((_) async {
  //   final getAppSetting = ref.read(appSettingProvider);
  //   if (getAppSetting.isFirstLaunch) {
  //     context.router.replaceAll(
  //       [const  OnboardingRoute()],
  //     );
  //   } else {
  //     context.router.replaceAll(
  //       [const HomeRoute()],
  //     );
  // }

  @override
  void initState() {
    super.initState();
    redirect();
  }

  Future<void> redirect() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    if (!mounted) {
      return;
    }

    context.replaceRoute(const OnboardingRoute());
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
