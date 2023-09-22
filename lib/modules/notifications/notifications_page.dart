import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

import '../../global/data/models/app_event/app_event.dart';
import '../../global/gen/strings.g.dart';
import '../../global/utils/app_mixin.dart';
import '../../global/widgets/empty_data.dart';
import '../../global/widgets/shimmer/shimmer_tile.dart';
import 'provider/notification_provider.dart';
import 'widgets/notification_tile.dart';

@RoutePage()
class NotificationPage extends ConsumerStatefulWidget {
  const NotificationPage({super.key});

  @override
  ConsumerState<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends ConsumerState<NotificationPage>
    with AppMixin {
  late StreamSubscription notiSub;
  late StreamSubscription userChangeSub;

  @override
  void initState() {
    notiSub = eventBus.on<UpsertNotificationEvent>().listen((_) {
      // ignore: unused_result
      ref.refresh(asyncNotificationProvider);
    });

    userChangeSub =
        FirebaseAuth.instance.authStateChanges().listen((firebaseUser) {
      final currentUser = FirebaseAuth.instance.currentUser;
      if (currentUser != null) {
        // ignore: unused_result
        ref.refresh(asyncNotificationProvider);
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    notiSub.cancel();
    userChangeSub.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final transl = Translations.of(context);
    final asyncNotification = ref.watch(asyncNotificationProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(transl.notification.title),
      ),
      body: LiquidPullToRefresh(
        onRefresh: () async {
          // ignore: unused_result
          ref.refresh(asyncNotificationProvider);
        },
        child: asyncNotification.when(
          data: (notifications) {
            if (notifications.isEmpty) {
              return const EmptyData();
            }

            return ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: notifications.length,
              itemBuilder: (context, index) {
                final item = notifications[index];
                return NotificationTile(
                  data: item,
                );
              },
              separatorBuilder: (_, __) => const Divider(),
            );
          },
          error: (err, _) => Center(child: Text('${transl.error.error}: $err')),
          loading: () {
            return ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              itemCount: 3,
              itemBuilder: (_, __) {
                return const ShimmerTile(height: 80);
              },
            );
          },
        ),
      ),
    );
  }
}
