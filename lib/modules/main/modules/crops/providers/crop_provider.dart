import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../global/data/models/crop/crop.dart';
import '../../../../../global/data/repositories/crop_repository.dart';

final cropProvider = FutureProvider<List<Crop>>((ref) async {
  final crops = await ref.read(cropRepositoryProvider).getCrops().then(
        (either) => either.fold(
          (l) => null,
          (r) => r,
        ),
      );

  return crops ?? [];
});
