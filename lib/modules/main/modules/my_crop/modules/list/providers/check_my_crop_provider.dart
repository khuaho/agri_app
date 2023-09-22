import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../../../global/data/repositories/user_crop_repository.dart';

final checkMyCropExistProvider = FutureProvider.autoDispose<bool>((ref) async {
  ref.onDispose(() {});
  final exist =
      await ref.read(userCropRepositoryProvider).checkUserCropExist().then(
            (either) => either.fold(
              (l) => null,
              (r) => r,
            ),
          );

  return exist!;
});
