import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../global/data/models/installation/installation.dart';
import '../../global/data/repositories/installation_repository.dart';
import '../../global/utils/riverpod/app_state.dart';

final installationProvider =
    StateNotifierProvider<InstallationProvider, AppState<Unit>>(
  (ref) => InstallationProvider(ref),
);

class InstallationProvider extends StateNotifier<AppState<Unit>> {
  InstallationProvider(this.ref) : super(AppState.initial());

  final Ref ref;

  Future<void> upsertInstallation(Installation data) async {
    state = AppState.loading();
    final installationRepository = ref.read(installationRepositoryProvider);
    await installationRepository.upsertInstallation(data).then(
          (either) => either.fold(
            (l) => state = AppState.error(l),
            (r) => state = AppState.data(r),
          ),
        );
  }
}
