import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../enum/crop_status.dart';
import '../models/failures/failure.dart';
import '../models/user_crop/user_crop.dart';
import '_base_repository.dart';

final userCropRepositoryProvider = Provider(
  (ref) => _UserCropRepositoryImpl(),
);

abstract class UserCropRepository {
  Future<Either<Failure, List<UserCrop>>> getUserCropsByStatus(
      CropStatus status);

  Future<Either<Failure, bool>> checkUserCropExist();

  Future<Either<Failure, UserCrop?>> getUserCrop(String? id);

  Future<Either<Failure, Unit>> addUserCrop(UserCrop data);

  Future<Either<Failure, Unit>> updateUserCrop(UserCrop data);

  Future<Either<Failure, int>> getUserCropCount();
}

class _UserCropRepositoryImpl extends BaseRepository
    implements UserCropRepository {
  final userCropRef = FirebaseFirestore.instance
      .collection('userCrops')
      .withUserCropConverter();

  @override
  Future<Either<Failure, List<UserCrop>>> getUserCropsByStatus(
    CropStatus status,
  ) {
    final currentUser = FirebaseAuth.instance.currentUser;

    return guardFuture(() async {
      await Future.delayed(const Duration(seconds: 1));
      final docSnapShot = await userCropRef
          .where('userId', isEqualTo: currentUser?.uid ?? '')
          .where('cropStatus', isEqualTo: status.value)
          .get();

      final data =
          docSnapShot.docs.map((e) => e.data().copyWith(uid: e.id)).toList();
      return data;
    });
  }

  @override
  Future<Either<Failure, bool>> checkUserCropExist() {
    final currentUser = FirebaseAuth.instance.currentUser;
    return guardFuture(() async {
      await Future.delayed(const Duration(seconds: 1));
      final docSnapShot = await userCropRef
          .where('userId', isEqualTo: currentUser?.uid ?? '')
          .get();
      final data =
          docSnapShot.docs.map((e) => e.data().copyWith(uid: e.id)).toList();

      if (data.isNotEmpty) {
        return true;
      }
      return false;
    });
  }

  @override
  Future<Either<Failure, UserCrop?>> getUserCrop(String? id) {
    return guardFuture(() async {
      await Future.delayed(const Duration(seconds: 1));

      final res = await userCropRef.doc(id).get();
      if (res.exists) {
        return res.data()?.copyWith(uid: res.id);
      }
      return null;
    });
  }

  @override
  Future<Either<Failure, Unit>> addUserCrop(UserCrop data) {
    return guardFuture(() async {
      await Future.delayed(const Duration(seconds: 1));
      await userCropRef.add(
        data,
      );

      return unit;
    });
  }

  @override
  Future<Either<Failure, Unit>> updateUserCrop(UserCrop data) {
    return guardFuture(() async {
      await Future.delayed(const Duration(seconds: 1));
      await userCropRef.doc(data.uid).update(
            data.toJson(),
          );
      return unit;
    });
  }

  @override
  Future<Either<Failure, int>> getUserCropCount() {
    final currentUser = FirebaseAuth.instance.currentUser;

    return guardFuture(() async {
      await Future.delayed(const Duration(seconds: 1));
      final query = await userCropRef
          .where('userId', isEqualTo: currentUser?.uid ?? '')
          .count()
          .get();

      return query.count;
    });
  }
}
