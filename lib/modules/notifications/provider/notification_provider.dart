import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../global/data/models/notification/notification.dart';
import '../../../global/data/repositories/notification_repository.dart';
import '../../../global/utils/app_mixin.dart';

final asyncNotificationProvider =
    AsyncNotifierProvider<AsyncNotificationNotifier, List<Notification>>(() {
  return AsyncNotificationNotifier();
});

class AsyncNotificationNotifier extends AsyncNotifier<List<Notification>>
    with AppMixin {
  Future<List<Notification>> _fetchNotifications() async {
    final user =
        await ref.read(notificationRepositoryProvider).getNotifications().then(
              (either) => either.fold(
                (l) => null,
                (r) => r,
              ),
            );

    return user ?? [];
  }

  @override
  FutureOr<List<Notification>> build() {
    return _fetchNotifications();
  }
}
