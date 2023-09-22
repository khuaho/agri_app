import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../global/data/models/app_event/app_event.dart';
import '../../global/data/models/notification/notification.dart';
import '../../global/data/repositories/notification_repository.dart';
import '../../global/utils/app_mixin.dart';
import '../../global/utils/riverpod/app_state.dart';

final notificationProvider =
    StateNotifierProvider<NotificationProvider, AppState<Unit>>(
  (ref) => NotificationProvider(ref),
);

class NotificationProvider extends StateNotifier<AppState<Unit>> with AppMixin {
  NotificationProvider(this.ref) : super(AppState.initial());

  final Ref ref;

  Future<void> upsertNotification(Notification data) async {
    state = AppState.loading();
    final notificationRepository = ref.read(notificationRepositoryProvider);
    await notificationRepository.upsertNotification(data: data).then(
          (either) => either.fold(
            (l) => state = AppState.error(l),
            (r) => state = AppState.data(r),
          ),
        );
    eventBus.fire(const UpsertNotificationEvent());
  }
}
