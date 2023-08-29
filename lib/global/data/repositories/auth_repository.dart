import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart' as fb;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../services/hive_service.dart';
import '../models/failures/failure.dart';
import '_base_repository.dart';

final authRepositoryProvider = Provider(_AuthRepositoryImpl.new);

abstract class AuthRepository {
  Future<Either<Failure, Unit>> signInWithEmailPassword({
    required String email,
    required String password,
  });

  Future<Either<Failure, Unit>> signUpWithEmailPassword({
    required String fullName,
    required String email,
    required String password,
  });

  Future<Either<Failure, Unit>> signInWithGoogle();

  Future<Either<Failure, Unit>> signOut();

  Future<Either<Failure, Unit>> changePassword({
    required String oldPassword,
    required String newPassword,
  });

  Future<Either<Failure, Unit>> deleteAccount();

  Future<Either<Failure, Unit>> resetPassword({required String email});

  Either<Failure, bool> checkSocialLogin();
}

class _AuthRepositoryImpl extends BaseRepository implements AuthRepository {
  _AuthRepositoryImpl(this.ref);

  Ref ref;

  final firebaseAuth = fb.FirebaseAuth.instance;

  @override
  Future<Either<Failure, Unit>> signInWithGoogle() {
    return guardFuture(() async {
      final googleUser = await GoogleSignIn().signIn();
      final googleAuth = await googleUser?.authentication;
      if (googleAuth?.accessToken == null) return unit;
      final oauthCredential = fb.GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      await firebaseAuth.signInWithCredential(oauthCredential);
      return unit;
    });
  }

  @override
  Future<Either<Failure, Unit>> signInWithEmailPassword({
    required String email,
    required String password,
  }) {
    return guardFuture(() async {
      await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return unit;
    });
  }

  @override
  Future<Either<Failure, Unit>> signOut() {
    return guardFuture(() async {
      if (GoogleSignIn().currentUser != null) {
        await GoogleSignIn().disconnect();
      }
      await ref.read(hiveServiceProvider).deleteUser();
      // await hiveService.deleteUserCredentials();
      // Hive.box(Constants.hiveGraphqlBox).clear();
      // await FirebaseMessaging.instance.deleteToken();
      await firebaseAuth.signOut();
      return unit;
    });
  }

  @override
  Future<Either<Failure, Unit>> signUpWithEmailPassword({
    required String fullName,
    required String email,
    required String password,
  }) {
    return guardFuture(
      () async {
        final oauthCredential =
            await firebaseAuth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );

        if (oauthCredential.user != null &&
            !oauthCredential.user!.emailVerified) {
          await firebaseAuth.currentUser?.updateDisplayName(fullName);
          await firebaseAuth.currentUser?.sendEmailVerification();
          await firebaseAuth.currentUser?.reload();
        }
        return unit;
      },
    );
  }

  @override
  Future<Either<Failure, Unit>> resetPassword({required String email}) {
    return guardFuture(() async {
      await firebaseAuth.sendPasswordResetEmail(email: email);
      return unit;
    });
  }

  @override
  Future<Either<Failure, Unit>> changePassword({
    required String oldPassword,
    required String newPassword,
  }) {
    return guardFuture(() async {
      var currentUser = firebaseAuth.currentUser;
      var cred = EmailAuthProvider.credential(
          email: currentUser!.email!, password: oldPassword);

      await currentUser.reauthenticateWithCredential(cred).then((value) {
        currentUser.updatePassword(newPassword);
      });

      return unit;
    });
  }

  @override
  Future<Either<Failure, Unit>> deleteAccount() {
    return guardFuture(() async {
      await firebaseAuth.currentUser!.delete();
      return unit;
    });
  }

  @override
  Either<Failure, bool> checkSocialLogin() {
    return guard(() {
      final providerId = firebaseAuth.currentUser!.providerData[0].providerId;
      if (providerId.contains('password')) {
        return false;
      } else {
        return true;
      }
    });
  }
}
