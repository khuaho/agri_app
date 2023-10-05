import 'package:agri_app/global/app_router/app_router.dart';
import 'package:agri_app/global/gen/strings.g.dart';
import 'package:agri_app/global/themes/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_localizations/flutter_localizations.dart';

Widget testableWidget({
  required Widget childWidget,
  List<Override> overrides = const [],
}) {
  final appRouter = AppRouter();
  return ProviderScope(
    overrides: overrides,
    child: TranslationProvider(
      child: MaterialApp.router(
        title: 'Agri',
        debugShowCheckedModeBanner: false,
        routerConfig: appRouter.config(),
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
      ),
    ),
  );
}
