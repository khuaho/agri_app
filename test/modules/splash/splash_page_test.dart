// import 'dart:io';

// import 'package:agri_app/app/providers/app_dir_provider.dart';
import 'package:agri_app/app/providers/app_settings_provider.dart';
import 'package:agri_app/modules/onboarding/onboarding_page.dart';
import 'package:agri_app/modules/splash/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../flutter_test_config.dart';
import '../wrapper.dart';

void main() {
  final ref = ProviderContainer(overrides: []);

  Future<void> buildWidget(WidgetTester tester) async {
    FlutterError.onError = ignoreOverflowErrors;
    await tester.pumpWidget(testableWidget(childWidget: const SplashPage()));
    await tester.pumpAndSettle(const Duration(seconds: 1));
  }

  testWidgets('Splash Page To Onboard Page', (tester) async {
    ref.read(appSettingProvider.notifier).update(
          (state) => state.copyWith(
            isFirstLaunch: true,
          ),
        );
    await buildWidget(tester);
    final getAppSetting = ref.read(appSettingProvider);
    expect(getAppSetting.isFirstLaunch, true);
    expect(find.byType(OnboardingPage), findsOneWidget);
    await tester.pumpAndSettle();
  });
}
