import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../enum/crop_status.dart';
import '../models/failures/failure.dart';
import '../models/my_crop/my_crop.dart';
import '_base_repository.dart';

final myCropRepositoryProvider = Provider(
  (ref) => _MyCropRepositoryImpl(),
);

abstract class MyCropRepository {
  // Future<Either<Failure, List<MyCrop>>> getMyCrops();

  Future<Either<Failure, List<MyCrop>>> getMyCropsByStatus(CropStatus status);

  Future<Either<Failure, bool>> checkMyCropExist();

  Future<Either<Failure, MyCrop?>> getMyCrop(String? id);

  Future<Either<Failure, Unit>> addMyCrop(MyCrop data);

  Future<Either<Failure, Unit>> updateMyCrop(MyCrop data);
}

class _MyCropRepositoryImpl extends BaseRepository implements MyCropRepository {
  // @override
  // Future<Either<Failure, List<MyCrop>>> getMyCrops() {
  //   return guardFuture(() async {
  //     await Future.delayed(const Duration(seconds: 1));
  //     final res = await myCropRef.get();
  //     final data = res.docs.map((e) => e.data().copyWith(uid: e.id)).toList();
  //     return data;
  //   });
  // }

  @override
  Future<Either<Failure, List<MyCrop>>> getMyCropsByStatus(CropStatus status) {
    final currentUser = FirebaseAuth.instance.currentUser;
    final myCropRef = FirebaseFirestore.instance
        .collection('myCrops')
        .doc(currentUser?.uid ?? '')
        .collection('crops')
        .withMyCropConverter();

    return guardFuture(() async {
      await Future.delayed(const Duration(seconds: 1));
      final docSnapShot =
          await myCropRef.where('cropStatus', isEqualTo: status.value).get();

      final data =
          docSnapShot.docs.map((e) => e.data().copyWith(uid: e.id)).toList();
      return data;
    });
  }

  @override
  Future<Either<Failure, bool>> checkMyCropExist() {
    final currentUser = FirebaseAuth.instance.currentUser;
    return guardFuture(() async {
      await Future.delayed(const Duration(seconds: 1));
      final myCropRef = FirebaseFirestore.instance
          .collection('myCrops')
          .doc(currentUser?.uid ?? '');

      final res = await myCropRef.get();

      if (res.exists) {
        return true;
      }
      return false;
    });
  }

  @override
  Future<Either<Failure, MyCrop?>> getMyCrop(String? id) {
    final currentUser = FirebaseAuth.instance.currentUser;
    final myCropRef = FirebaseFirestore.instance
        .collection('myCrops')
        .doc(currentUser?.uid ?? '')
        .collection('crops')
        .withMyCropConverter();

    return guardFuture(() async {
      await Future.delayed(const Duration(seconds: 1));

      final res = await myCropRef.doc(id).get();
      if (res.exists) {
        return res.data()!.copyWith(uid: res.id);
      }
      return null;
    });
  }

  @override
  Future<Either<Failure, Unit>> addMyCrop(MyCrop data) {
    final currentUser = FirebaseAuth.instance.currentUser;
    final myCropRef = FirebaseFirestore.instance
        .collection('myCrops')
        .doc(currentUser?.uid ?? '')
        .collection('crops')
        .withMyCropConverter();

    return guardFuture(() async {
      await Future.delayed(const Duration(seconds: 1));
      await myCropRef.add(data);

      return unit;
    });
  }

  @override
  Future<Either<Failure, Unit>> updateMyCrop(MyCrop data) {
    final currentUser = FirebaseAuth.instance.currentUser;
    final myCropRef = FirebaseFirestore.instance
        .collection('myCrops')
        .doc(currentUser?.uid ?? '')
        .collection('crops')
        .withMyCropConverter();

    return guardFuture(() async {
      await Future.delayed(const Duration(seconds: 1));
      await myCropRef.doc(data.uid).update(data.toJson());
      return unit;
    });
  }
}
