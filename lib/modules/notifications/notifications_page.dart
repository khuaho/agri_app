import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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

class _NotificationPageState extends ConsumerState<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    final asyncNotification = ref.watch(asyncNotificationProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
      ),
      body: asyncNotification.when(
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
        error: (err, _) => Center(child: Text('Error: $err')),
        loading: () {
          return ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            itemCount: 2,
            itemBuilder: (_, __) {
              return const ShimmerTile(height: 60);
            },
          );
        },
      ),
    );
  }
}
