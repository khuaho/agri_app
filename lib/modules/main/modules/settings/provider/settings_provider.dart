import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../global/data/repositories/auth_repository.dart';
import '../../../../../global/utils/riverpod/app_state.dart';

final setingsProvider = StateNotifierProvider<SettingsProvider, AppState<Unit>>(
  SettingsProvider.new,
);

class SettingsProvider extends StateNotifier<AppState<Unit>> {
  SettingsProvider(this.ref) : super(AppState.initial());

  final Ref ref;
  late final authRepository = ref.watch(authRepositoryProvider);

  Future<void> logout() async {
    await authRepository.signOut().then(
          (either) => either.fold(
            (l) => state = AppState.error(l),
            (r) => AppState.data(r),
          ),
        );
  }
}
