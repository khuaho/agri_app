import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../global/app_router/app_router.dart';
import '../../global/themes/app_colors.dart';

@RoutePage()
class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late final StreamSubscription changePageSubscription,
      loadBadgeMailboxSubscription;
  TabsRouter? tabsRouter;
  int pageIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    changePageSubscription.cancel();
    loadBadgeMailboxSubscription.cancel();
    super.dispose();
  }

  final routes = [
    const HomeRoute(),
    const CropsRoute(),
    const SettingsRoute(),
  ];

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: routes,
      transitionBuilder: (context, child, animation) => FadeTransition(
        opacity: animation,
        child: child,
      ),
      builder: (context, child) {
        tabsRouter = AutoTabsRouter.of(context);

        return Scaffold(
          body: child,
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: tabsRouter!.activeIndex,
            onTap: (index) {
              tabsRouter!.setActiveIndex(index);
            },
            selectedItemColor: AppColors.primary,
            showUnselectedLabels: true,
            type: BottomNavigationBarType.fixed,
            items: const [
              BottomNavigationBarItem(
                label: 'Home',
                icon: Icon(Icons.home_outlined),
                activeIcon: Icon(Icons.home),
              ),
              BottomNavigationBarItem(
                label: 'Crops',
                icon: Icon(Icons.local_florist),
                activeIcon: Icon(Icons.local_florist),
              ),
              BottomNavigationBarItem(
                label: 'Setting',
                icon: Icon(Icons.settings_outlined),
                activeIcon: Icon(Icons.settings),
              ),
            ],
          ),
        );
      },
    );
  }
}
