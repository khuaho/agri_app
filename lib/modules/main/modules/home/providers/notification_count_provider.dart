import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../global/data/repositories/notification_repository.dart';

final notificationUnreadCount = FutureProvider<int>(
  (ref) async {
    final notificationRepository = ref.read(notificationRepositoryProvider);
    final count =
        await notificationRepository.getNotificationsUnreadCount().then(
              (either) => either.fold(
                (l) => 0,
                (r) => r,
              ),
            );
    return count;
  },
);
