import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../global/data/models/crop/crop.dart';
import '../../../../../global/data/repositories/crop_repository.dart';

final searchKeywordProvider = StateProvider<String>((ref) => '');

final cropSearchProvider = FutureProvider<List<Crop>>((ref) async {
  final keyword = ref.watch(searchKeywordProvider);
  final crops =
      await ref.read(cropRepositoryProvider).searchCropByName(keyword).then(
            (either) => either.fold(
              (l) => null,
              (r) => r,
            ),
          );

  return crops ?? [];
});
