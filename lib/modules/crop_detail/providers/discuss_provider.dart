import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../global/data/models/discuss/discuss.dart';
import '../../../global/data/models/notification/notification.dart';
import '../../../global/data/repositories/discuss_repository.dart';
import '../../../global/data/repositories/installation_repository.dart';
import '../../../global/data/repositories/notification_repository.dart';
import '../../../global/utils/riverpod/app_state.dart';

final discussProvider = StateNotifierProvider.family
    .autoDispose<DiscussProvider, AppState<List<Discuss>?>, String?>(
  DiscussProvider.new,
);

class DiscussProvider extends StateNotifier<AppState<List<Discuss>?>> {
  DiscussProvider(this.ref, this.cropId) : super(AppState.loading()) {
    fetchDiscuss();
  }

  final Ref ref;
  final String? cropId;
  late final discussRepository = ref.watch(discussRepositoryProvider(cropId!));

  void fetchDiscuss() {
    if (cropId != null) {
      discussRepository.getDiscuss().then(
            (either) => either.fold(
              (l) => state = AppState.error(l),
              (r) => state = AppState.data(r),
            ),
          );
    } else {
      state = AppState.data(null);
    }
  }

  Future<void> addDiscuss(Discuss discuss) async {
    if (cropId != null) {
      await discussRepository.addDiscuss(discuss).then(
            (either) => either.fold(
              (l) => state = AppState.error(l),
              (r) => r,
            ),
          );
    }

    return fetchDiscuss();
  }

  Future<void> deleteDiscuss(String id) async {
    if (cropId != null) {
      await discussRepository.deleteDiscuss(id).then(
            (either) => either.fold(
              (l) => state = AppState.error(l),
              (r) => r,
            ),
          );
    }

    return fetchDiscuss();
  }

  Future<void> changedReact(Discuss data) async {
    if (cropId != null) {
      await discussRepository.changedReaction(data).then(
            (either) => either.fold(
              (l) => state = AppState.error(l),
              (r) => r,
            ),
          );
    }

    return fetchDiscuss();
  }

  Future<void> sendNotificationWhenReact(Notification data) async {
    final notiRepository = ref.read(notificationRepositoryProvider);
    final installationRepository = ref.read(installationRepositoryProvider);
    final userInstallation = await installationRepository
        .getUserInstallation(data.userId ?? '')
        .then(
          (either) => either.fold(
            (l) => null,
            (r) => r,
          ),
        );
    if (userInstallation != null) {
      await notiRepository.upsertNotification(
        data: data.copyWith(
          isRead: false,
          content: {
            'en': 'expressed his feelings about your comment',
            'vi': 'bày tỏ cảm xúc về bình luận của bạn'
          },
        ),
        token: userInstallation.token ?? '',
      );
    }
  }
}
