import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather/weather.dart';

import '../../../../../global/data/models/app_event/app_event.dart';
import '../../../../../global/gen/strings.g.dart';
import '../../../../../global/themes/app_colors.dart';
import '../../../../../global/utils/app_mixin.dart';
import '../../../../../global/widgets/avatar.dart';

class HomeHeader extends ConsumerStatefulWidget {
  const HomeHeader({super.key, this.weather});

  final Weather? weather;

  @override
  ConsumerState<HomeHeader> createState() => _HomeHeaderState();
}

class _HomeHeaderState extends ConsumerState<HomeHeader> with AppMixin {
  late StreamSubscription updateUserSub;
  User? currentUser = FirebaseAuth.instance.currentUser;
  @override
  void initState() {
    updateUserSub = eventBus.on<UpdateUserEvent>().listen((_) {
      setState(() {
        currentUser = FirebaseAuth.instance.currentUser;
      });
    });

    super.initState();
  }

  @override
  void dispose() {
    updateUserSub.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final transl = Translations.of(context);

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
                      value: widget.weather?.weatherDescription ?? ''),
                  style: textTheme.titleLarge?.copyWith(
                    color: AppColors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Avatar(
                name: currentUser?.displayName,
                imageUrl: currentUser?.photoURL,
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
          )
        ],
      ),
    );
  }
}
