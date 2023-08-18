import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../global/data/models/crop/crop.dart';
import '../../../global/data/repositories/crop_repository.dart';
import '../../../global/utils/riverpod/app_state.dart';

final cropDetailProvider = StateNotifierProvider.family
    .autoDispose<CropDetailProvider, AppState<Crop?>, String?>(
  CropDetailProvider.new,
);

class CropDetailProvider extends StateNotifier<AppState<Crop?>> {
  CropDetailProvider(this.ref, this.id) : super(AppState.loading()) {
    if (id != null) {
      ref.read(cropRepositoryProvider).getCrop(id!).then(
            (either) => either.fold(
              (l) => state = AppState.error(l),
              (r) => state = AppState.data(r),
            ),
          );
    } else {
      state = AppState.data(null);
    }
  }

  final Ref ref;
  final String? id;
}
