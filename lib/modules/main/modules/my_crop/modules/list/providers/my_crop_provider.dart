import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../../../global/data/models/my_crop/my_crop.dart';
import '../../../../../../../global/data/repositories/my_crop_repository.dart';
import '../../../../../../../global/enum/crop_status.dart';
import '../../../../../../../global/utils/riverpod/app_state.dart';

final myCropProvider = StateNotifierProvider.family<MyCropProvider,
    AppState<List<MyCrop>?>, CropStatus>(
  MyCropProvider.new,
);

class MyCropProvider extends StateNotifier<AppState<List<MyCrop>?>> {
  MyCropProvider(this.ref, this.cropStatus) : super(AppState.loading()) {
    fetchMyCrops();
  }

  final Ref ref;
  final CropStatus cropStatus;
  late final myCropRepository = ref.read(myCropRepositoryProvider);

  void fetchMyCrops() {
    myCropRepository.getMyCropsByStatus(cropStatus).then(
          (either) => either.fold(
            (l) => state = AppState.error(l),
            (r) => state = AppState.data(r),
          ),
        );
  }
}
