import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../global/data/models/crop/crop.dart';
import '../../../../../global/data/repositories/crop_repository.dart';

final asyncCropsProvider =
    AsyncNotifierProvider<AsyncCropsNotifier, List<Crop>>(() {
  return AsyncCropsNotifier();
});

class AsyncCropsNotifier extends AsyncNotifier<List<Crop>> {
  Future<List<Crop>> _fetchCrop() async {
    final crops = await ref.read(cropRepositoryProvider).getCrops().then(
          (either) => either.fold(
            (l) => null,
            (r) => r,
          ),
        );

    return crops ?? [];
  }

  @override
  FutureOr<List<Crop>> build() {
    return _fetchCrop();
  }
}
