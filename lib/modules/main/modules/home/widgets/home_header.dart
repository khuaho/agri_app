import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather/weather.dart';

import '../../../../../global/app_router/app_router.dart';
import '../../../../../global/data/models/app_event/app_event.dart';
import '../../../../../global/gen/strings.g.dart';
import '../../../../../global/themes/app_colors.dart';
import '../../../../../global/utils/app_mixin.dart';
import '../../../../../global/widgets/avatar.dart';
import '../providers/notification_count_provider.dart';

class HomeHeader extends ConsumerStatefulWidget {
  const HomeHeader({super.key, this.weather});

  final Weather? weather;

  @override
  ConsumerState<HomeHeader> createState() => _HomeHeaderState();
}

class _HomeHeaderState extends ConsumerState<HomeHeader> with AppMixin {
  late StreamSubscription updateUserSub;
  late StreamSubscription unreadCountSub;
  User? currentUser = FirebaseAuth.instance.currentUser;

  @override
  void initState() {
    updateUserSub = eventBus.on<UpdateUserEvent>().listen((_) {
      setState(() {
        currentUser = FirebaseAuth.instance.currentUser;
      });
    });

    unreadCountSub = eventBus.on<UpsertNotificationEvent>().listen((_) {
      // ignore: unused_result
      ref.refresh(notificationUnreadCount);
    });
    super.initState();
  }

  @override
  void didUpdateWidget(covariant HomeHeader oldWidget) {
    // ignore: unused_result
    ref.refresh(notificationUnreadCount);
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    updateUserSub.cancel();
    unreadCountSub.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final transl = Translations.of(context);
    final unreadCount = ref.watch(notificationUnreadCount).value ?? 0;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: const BoxDecoration(
        color: AppColors.primary,
      ),
      height: MediaQuery.of(context).size.height * 0.25,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  transl.home.hello.you,
                  style: textTheme.titleLarge?.copyWith(
                    color: AppColors.white,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  transl.home.weatherDes(
                    value: widget.weather?.weatherDescription ?? '',
                  ),
                  style: textTheme.titleLarge?.copyWith(
                    color: AppColors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 6),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      context.pushRoute(const NotificationRoute());
                    },
                    splashRadius: 30,
                    icon: Badge(
                      isLabelVisible: unreadCount > 0,
                      backgroundColor: AppColors.errorDefault,
                      label: Text(
                        unreadCount.toString(),
                      ),
                      textStyle: const TextStyle(
                        fontSize: 12,
                        color: AppColors.white,
                      ),
                      child: const Icon(
                        Icons.notifications,
                        color: AppColors.white,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => context.pushRoute(const ProfileRoute()),
                    child: Avatar(
                      name: currentUser?.displayName,
                      imageUrl: currentUser?.photoURL,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 6),
              Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: AppColors.alertSoft,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.location_searching,
                      size: 16,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      widget.weather?.areaName ?? '',
                      style: textTheme.titleSmall,
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
