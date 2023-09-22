import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../../../global/data/models/app_event/app_event.dart';
import '../../../../../../../global/data/models/user_crop/user_crop.dart';
import '../../../../../../../global/data/repositories/user_crop_repository.dart';
import '../../../../../../../global/utils/app_mixin.dart';
import '../../../../../../../global/utils/riverpod/app_state.dart';

final upsertMyCropProvider = StateNotifierProvider.family<UpsertMyCropProvider,
    AppState<UserCrop?>, String?>(
  UpsertMyCropProvider.new,
);

class UpsertMyCropProvider extends StateNotifier<AppState<UserCrop?>>
    with AppMixin {
  UpsertMyCropProvider(this.ref, this.id) : super(AppState.loading()) {
    fetchMyCrop();
  }

  final Ref ref;
  final String? id;
  late final myCropRepository = ref.read(userCropRepositoryProvider);

  void fetchMyCrop() {
    myCropRepository.getUserCrop(id).then(
          (either) => either.fold(
            (l) => state = AppState.error(l),
            (r) => state = AppState.data(r),
          ),
        );
  }

  Future<void> upsertMyCrop(UserCrop data) async {
    final functionRepository = data.uid != null
        ? myCropRepository.updateUserCrop(data)
        : myCropRepository.addUserCrop(data);

    await functionRepository.then(
      (either) => either.fold(
        (l) {
          return AppState.error(l);
        },
        (r) {
          eventBus.fire(const CreateMyCropEvent());
          return AppState.data(r);
        },
      ),
    );
  }
}
