import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../global/data/models/crop_type/crop_type.dart';
import '../../../../../global/data/repositories/crop_type_repository.dart';
import '../../../../../global/utils/riverpod/app_state.dart';

final cropTypeProvider = StateNotifierProvider.autoDispose<CropTypeProvider,
    AppState<List<CropType>>>(
  CropTypeProvider.new,
);

class CropTypeProvider extends StateNotifier<AppState<List<CropType>>> {
  CropTypeProvider(this.ref) : super(AppState.loading()) {
    ref.read(cropTypeRepositoryProvider).getCropTypes().then(
          (either) => either.fold(
            (l) => state = AppState.error(l),
            (r) => state = AppState.data(r),
          ),
        );
  }

  final AutoDisposeRef ref;
}
