import 'dart:async';
import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../global/data/models/app_event/app_event.dart';
import '../../../global/data/models/user/user.dart';
import '../../../global/data/repositories/file_repository.dart';
import '../../../global/data/repositories/user_repository.dart';
import '../../../global/utils/app_mixin.dart';

final asyncProfileProvider =
    AsyncNotifierProvider<AsyncProfileNotifier, User>(() {
  return AsyncProfileNotifier();
});

class AsyncProfileNotifier extends AsyncNotifier<User> with AppMixin {
  Future<User> _fetchUser() async {
    final user = await ref.read(userRepositoryProvider).getMe().then(
          (either) => either.fold(
            (l) => null,
            (r) => r,
          ),
        );

    return user ?? User();
  }

  @override
  FutureOr<User> build() {
    return _fetchUser();
  }

  Future<void> updateUser(
      Map<String, dynamic> data, bool isUpdateAvatar) async {
    final fileRepo = ref.read(fileRepositoryProvider);
    state = const AsyncValue.loading();
    if (isUpdateAvatar == true) {
      final urlAvatar = await fileRepo
          .uploadFile(
            folder: 'avatar',
            file: File(data['avatar']),
          )
          .then(
            (either) => either.fold(
              (l) => null,
              (r) => r,
            ),
          );
      final user = User(
        username: data['username'],
        fullName: data['fullName'],
        email: data['email'],
        gender: data['gender'],
        role: data['role'],
        avatar: urlAvatar,
      );

      state = await AsyncValue.guard(() async {
        await ref.read(userRepositoryProvider).updateUser(user).then(
              (either) => either.fold(
                (l) => null,
                (r) => r,
              ),
            );
        eventBus.fire(const UpdateUserEvent());
        return _fetchUser();
      });
    } else {
      state = await AsyncValue.guard(() async {
        await ref
            .read(userRepositoryProvider)
            .updateUser(User.fromJson(data))
            .then(
              (either) => either.fold(
                (l) => null,
                (r) => r,
              ),
            );

        return _fetchUser();
      });
    }
  }
}
