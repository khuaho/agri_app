import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../global/data/repositories/crop_repository.dart';
import '../../../../../global/data/repositories/notification_repository.dart';
import '../../../../../global/data/repositories/user_crop_repository.dart';

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

final cropCountProvider = FutureProvider<int>(
  (ref) async {
    final cropRepository = ref.read(cropRepositoryProvider);
    final count = await cropRepository.getCropCount().then(
          (either) => either.fold(
            (l) => 0,
            (r) => r,
          ),
        );
    return count;
  },
);

final userCropCountProvider = FutureProvider<int>(
  (ref) async {
    final userCropRepository = ref.read(userCropRepositoryProvider);
    final count = await userCropRepository.getUserCropCount().then(
          (either) => either.fold(
            (l) => 0,
            (r) => r,
          ),
        );
    return count;
  },
);
