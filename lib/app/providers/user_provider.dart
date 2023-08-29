import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../global/data/models/user/user.dart';
import '../../global/services/hive_service.dart';

final userProvider = StateNotifierProvider<UserProvider, User>(
  (ref) => UserProvider(
    ref.watch(hiveServiceProvider),
  ),
);

class UserProvider extends StateNotifier<User> {
  UserProvider(this._hiveService)
      : super(
          _hiveService.getUser().fold(
                (l) => User(),
                (r) => r,
              ),
        );

  final HiveService _hiveService;

  User getUser() {
    return _hiveService.getUser().fold(
          (l) => User(),
          (r) => r,
        );
  }
}
