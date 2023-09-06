import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../modules/main/modules/home/home_page.dart';
import '../../modules/main/modules/settings/settings_page.dart';
import '../../modules/main/modules/crops/crops_page.dart';
import '../../modules/main/main_page.dart';
import '../../modules/login/login_page.dart';
import '../../modules/onboarding/onboarding_page.dart';
import '../../modules/register/register_page.dart';
import '../../modules/splash/splash_page.dart';
import '../../modules/crop_detail/crop_detail_page.dart';
import '../../modules/profile/profile_page.dart';
import '../../modules/location/location_page.dart';
import 'auth_guard.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends _$AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          path: '/splash',
          page: SplashRoute.page,
          initial: true,
        ),
        AutoRoute(path: '/onboarding', page: OnboardingRoute.page),
        AutoRoute(path: '/register', page: RegisterRoute.page),
        AutoRoute(path: '/login', page: LoginRoute.page),
        AutoRoute(
          path: '/main',
          page: MainRoute.page,
          guards: [AuthGuard()],
          children: [
            AutoRoute(path: 'home', page: HomeRoute.page),
            AutoRoute(path: 'crops', page: CropsRoute.page),
            AutoRoute(path: 'settings', page: SettingsRoute.page),
          ],
        ),
        AutoRoute(
          path: '/crop_detail',
          page: CropDetailRoute.page,
          guards: [AuthGuard()],
        ),
        AutoRoute(
          path: '/profile',
          page: ProfileRoute.page,
          guards: [AuthGuard()],
        ),
        AutoRoute(path: '/location', page: LocationRoute.page)
      ];
}
