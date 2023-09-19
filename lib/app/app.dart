import 'providers/app_settings_provider.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../flavors.dart';
import '../global/app_router/app_router.dart';
import '../global/extensions/app_locale_ext.dart';
import '../global/gen/strings.g.dart';
import '../global/themes/app_themes.dart';

class MyApp extends ConsumerStatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> with WidgetsBindingObserver {
  final appRouter = AppRouter();

  @override
  void initState() {
    initLocale();
    super.initState();
  }

  void initLocale() {
    final appSettingsController = ref.read(appSettingProvider.notifier);
    final currentLocale = ref.read(appSettingProvider).locale;
    appSettingsController.changeLocale(currentLocale);
  }

  // @override
  // void didChangeAppLifecycleState(AppLifecycleState state) async {
  //   super.didChangeAppLifecycleState(state);

  //   switch (state) {
  //     case AppLifecycleState.resumed:
  //       print('resumed');
  //       if (await Permission.location.serviceStatus.isDisabled) {
  //         if (!mounted) return;
  //         await GeolocatorService.checkPermission(context);
  //       }
  //       break;
  //     default:
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: F.title,
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter.config(),
      locale: ref.watch(appSettingProvider).locale.toLocale(),
      supportedLocales: AppLocaleUtils.supportedLocales,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      theme: AppThemes.light(),
      builder: (context, child) => MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
        child: child ?? const SizedBox(),
      ),
    );
  }
}
