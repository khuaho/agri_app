import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/failures/failure.dart';
import '../models/installation/installation.dart';
import '_base_repository.dart';

final installationRepositoryProvider = Provider(
  (ref) => _InstallationRepositoryImpl(),
);

abstract class InstallationRepository {
  Future<Either<Failure, Installation>> getUserInstallation(String userId);

  Future<Either<Failure, Unit>> upsertInstallation(Installation data);
}

class _InstallationRepositoryImpl extends BaseRepository
    implements InstallationRepository {
  final installationRef = FirebaseFirestore.instance
      .collection('userInstallation')
      .withInstallationConverter();

  @override
  Future<Either<Failure, Installation>> getUserInstallation(String userId) {
    return guardFuture(() async {
      await Future.delayed(const Duration(seconds: 1));
      final docSnapShot =
          await installationRef.where('userId', isEqualTo: userId).get();
      final data =
          docSnapShot.docs.map((e) => e.data().copyWith(id: e.id)).toList();

      return data.first;
    });
  }

  @override
  Future<Either<Failure, Unit>> upsertInstallation(Installation data) {
    final currentUser = FirebaseAuth.instance.currentUser;
    return guardFuture(() async {
      await Future.delayed(const Duration(seconds: 1));
      final myInstallation = await getUserInstallation(currentUser!.uid).then(
        (either) => either.fold((l) => null, (r) => r),
      );

      if (myInstallation?.id != null) {
        await installationRef.doc(myInstallation?.id).update(
              data.copyWith(userId: myInstallation?.userId).toJson(),
            );
      } else {
        await installationRef.add(data.copyWith(userId: currentUser.uid));
      }

      return unit;
    });
  }
}
