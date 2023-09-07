import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../../../global/data/repositories/my_crop_repository.dart';

final checkMyCropExistProvider = FutureProvider.autoDispose<bool>((ref) async {
  ref.onDispose(() {});
  final exist =
      await ref.read(myCropRepositoryProvider).checkMyCropExist().then(
            (either) => either.fold(
              (l) => null,
              (r) => r,
            ),
          );

  return exist!;
});
