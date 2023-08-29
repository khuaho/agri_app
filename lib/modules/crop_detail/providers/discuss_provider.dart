import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../global/data/models/discuss/discuss.dart';
import '../../../global/data/repositories/discuss_repository.dart';
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
}
