import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../global/data/repositories/auth_repository.dart';
import '../../../global/data/repositories/user_repository.dart';
import '../../../global/utils/riverpod/app_state.dart';

final registerProvider =
    StateNotifierProvider<RegisterProvider, AppState<Unit>>(
  RegisterProvider.new,
);

class RegisterProvider extends StateNotifier<AppState<Unit>> {
  RegisterProvider(this.ref) : super(AppState.initial());

  final Ref ref;
  late final authRepository = ref.watch(authRepositoryProvider);
  late final userRepository = ref.watch(userRepositoryProvider);

  Future<void> signUpWithEmailPassword(Map<String, dynamic> data) async {
    FocusManager.instance.primaryFocus?.unfocus();
    state = AppState.loading();
    await authRepository
        .signUpWithEmailPassword(
          fullName: data['fullName'],
          email: data['email'],
          password: data['confirmPassword'],
        )
        .then(
          (either) => either.fold(
            (l) => state = AppState.error(l),
            (r) => state = AppState.data(r),
          ),
        );

    if (state.data != null) {
      userRepository.addUser(data).then(
            (either) => either.fold(
              (l) => state = AppState.error(l),
              (r) => state = AppState.data(r),
            ),
          );
    }
  }
}
