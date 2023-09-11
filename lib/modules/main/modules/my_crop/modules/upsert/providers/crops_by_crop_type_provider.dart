import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../../../global/data/models/crop/crop.dart';
import '../../../../../../../global/data/repositories/crop_repository.dart';

final cropsByCropTypeProvider = FutureProvider.family<List<Crop>, String?>(
  (ref, cropTypeId) async {
    final cropRepository = ref.read(cropRepositoryProvider);
    if (cropTypeId != null) {
      final crops = await cropRepository.getCropsByCropType(cropTypeId).then(
            (either) => either.fold((l) => null, (r) => r),
          );
      return crops ?? [];
    }
    return [];
  },
);
