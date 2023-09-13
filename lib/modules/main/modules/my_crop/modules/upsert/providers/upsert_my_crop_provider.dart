import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../../../global/data/models/my_crop/my_crop.dart';
import '../../../../../../../global/data/repositories/my_crop_repository.dart';
import '../../../../../../../global/utils/riverpod/app_state.dart';

final upsertMyCropProvider = StateNotifierProvider.family<UpsertMyCropProvider,
    AppState<MyCrop?>, String?>(
  UpsertMyCropProvider.new,
);

class UpsertMyCropProvider extends StateNotifier<AppState<MyCrop?>> {
  UpsertMyCropProvider(this.ref, this.id) : super(AppState.loading()) {
    fetchMyCrop();
  }

  final Ref ref;
  final String? id;
  late final myCropRepository = ref.read(myCropRepositoryProvider);

  void fetchMyCrop() {
    myCropRepository.getMyCrop(id).then(
          (either) => either.fold(
            (l) => state = AppState.error(l),
            (r) => state = AppState.data(r),
          ),
        );
  }

  Future<void> upsertMyCrop(MyCrop data) async {
    state = AppState.loading();
    final functionRepository = data.uid != null
        ? myCropRepository.updateMyCrop(data)
        : myCropRepository.addMyCrop(data);

    await functionRepository.then(
      (either) => either.fold(
        (l) => AppState.error(l),
        (r) {
          return AppState.data(r);
        },
      ),
    );
  }
}
