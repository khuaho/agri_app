// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    SplashRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SplashPage(),
      );
    },
    RegisterRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const RegisterPage(),
      );
    },
    ProfileRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ProfilePage(),
      );
    },
    CropDetailRoute.name: (routeData) {
      final args = routeData.argsAs<CropDetailRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: CropDetailPage(
          key: args.key,
          id: args.id,
        ),
      );
    },
    MainRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MainPage(),
      );
    },
    SettingsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SettingsPage(),
      );
    },
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomePage(),
      );
    },
    CropsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const CropsPage(),
      );
    },
    UpsertMyCropRoute.name: (routeData) {
      final args = routeData.argsAs<UpsertMyCropRouteArgs>(
          orElse: () => const UpsertMyCropRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: UpsertMyCropPage(
          key: args.key,
          id: args.id,
        ),
      );
    },
    MyCropDetailRoute.name: (routeData) {
      final args = routeData.argsAs<MyCropDetailRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: MyCropDetailPage(
          key: args.key,
          id: args.id,
        ),
      );
    },
    MyCropsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MyCropsPage(),
      );
    },
    LoginRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const LoginPage(),
      );
    },
    OnboardingRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const OnboardingPage(),
      );
    },
  };
}

/// generated route for
/// [SplashPage]
class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute({List<PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [RegisterPage]
class RegisterRoute extends PageRouteInfo<void> {
  const RegisterRoute({List<PageRouteInfo>? children})
      : super(
          RegisterRoute.name,
          initialChildren: children,
        );

  static const String name = 'RegisterRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ProfilePage]
class ProfileRoute extends PageRouteInfo<void> {
  const ProfileRoute({List<PageRouteInfo>? children})
      : super(
          ProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [CropDetailPage]
class CropDetailRoute extends PageRouteInfo<CropDetailRouteArgs> {
  CropDetailRoute({
    Key? key,
    required String id,
    List<PageRouteInfo>? children,
  }) : super(
          CropDetailRoute.name,
          args: CropDetailRouteArgs(
            key: key,
            id: id,
          ),
          initialChildren: children,
        );

  static const String name = 'CropDetailRoute';

  static const PageInfo<CropDetailRouteArgs> page =
      PageInfo<CropDetailRouteArgs>(name);
}

class CropDetailRouteArgs {
  const CropDetailRouteArgs({
    this.key,
    required this.id,
  });

  final Key? key;

  final String id;

  @override
  String toString() {
    return 'CropDetailRouteArgs{key: $key, id: $id}';
  }
}

/// generated route for
/// [MainPage]
class MainRoute extends PageRouteInfo<void> {
  const MainRoute({List<PageRouteInfo>? children})
      : super(
          MainRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SettingsPage]
class SettingsRoute extends PageRouteInfo<void> {
  const SettingsRoute({List<PageRouteInfo>? children})
      : super(
          SettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [HomePage]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [CropsPage]
class CropsRoute extends PageRouteInfo<void> {
  const CropsRoute({List<PageRouteInfo>? children})
      : super(
          CropsRoute.name,
          initialChildren: children,
        );

  static const String name = 'CropsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [UpsertMyCropPage]
class UpsertMyCropRoute extends PageRouteInfo<UpsertMyCropRouteArgs> {
  UpsertMyCropRoute({
    Key? key,
    String? id,
    List<PageRouteInfo>? children,
  }) : super(
          UpsertMyCropRoute.name,
          args: UpsertMyCropRouteArgs(
            key: key,
            id: id,
          ),
          initialChildren: children,
        );

  static const String name = 'UpsertMyCropRoute';

  static const PageInfo<UpsertMyCropRouteArgs> page =
      PageInfo<UpsertMyCropRouteArgs>(name);
}

class UpsertMyCropRouteArgs {
  const UpsertMyCropRouteArgs({
    this.key,
    this.id,
  });

  final Key? key;

  final String? id;

  @override
  String toString() {
    return 'UpsertMyCropRouteArgs{key: $key, id: $id}';
  }
}

/// generated route for
/// [MyCropDetailPage]
class MyCropDetailRoute extends PageRouteInfo<MyCropDetailRouteArgs> {
  MyCropDetailRoute({
    Key? key,
    required String id,
    List<PageRouteInfo>? children,
  }) : super(
          MyCropDetailRoute.name,
          args: MyCropDetailRouteArgs(
            key: key,
            id: id,
          ),
          initialChildren: children,
        );

  static const String name = 'MyCropDetailRoute';

  static const PageInfo<MyCropDetailRouteArgs> page =
      PageInfo<MyCropDetailRouteArgs>(name);
}

class MyCropDetailRouteArgs {
  const MyCropDetailRouteArgs({
    this.key,
    required this.id,
  });

  final Key? key;

  final String id;

  @override
  String toString() {
    return 'MyCropDetailRouteArgs{key: $key, id: $id}';
  }
}

/// generated route for
/// [MyCropsPage]
class MyCropsRoute extends PageRouteInfo<void> {
  const MyCropsRoute({List<PageRouteInfo>? children})
      : super(
          MyCropsRoute.name,
          initialChildren: children,
        );

  static const String name = 'MyCropsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [LoginPage]
class LoginRoute extends PageRouteInfo<void> {
  const LoginRoute({List<PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [OnboardingPage]
class OnboardingRoute extends PageRouteInfo<void> {
  const OnboardingRoute({List<PageRouteInfo>? children})
      : super(
          OnboardingRoute.name,
          initialChildren: children,
        );

  static const String name = 'OnboardingRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
