import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/crop/crop.dart';
import '../models/failures/failure.dart';
import '_base_repository.dart';

final cropRepositoryProvider = Provider(
  (ref) => _CropRepositoryImpl(),
);

abstract class CropRepository {
  Future<Either<Failure, List<Crop>>> getCrops();

  Future<Either<Failure, Crop?>> getCrop(String? id);

  Future<Either<Failure, List<Crop>>> searchCropByName(String keyword);
}

class _CropRepositoryImpl extends BaseRepository implements CropRepository {
  final cropRef =
      FirebaseFirestore.instance.collection('crops').withCropConverter();

  @override
  Future<Either<Failure, List<Crop>>> getCrops() {
    return guardFuture(() async {
      await Future.delayed(const Duration(seconds: 1));
      final res = await cropRef.get();
      final data = res.docs.map((e) => e.data()).toList();
      return data;
    });
  }

  @override
  Future<Either<Failure, Crop?>> getCrop(String? id) {
    return guardFuture(() async {
      await Future.delayed(const Duration(seconds: 1));

      final res = await cropRef.doc(id).get();
      if (res.exists) {
        return res.data()!;
      }

      return null;
    });
  }

  @override
  Future<Either<Failure, List<Crop>>> searchCropByName(String keyword) {
    return guardFuture(() async {
      await Future.delayed(const Duration(seconds: 1));

      final docSnapShot =
          await cropRef.where('nameVi', isGreaterThanOrEqualTo: keyword).get();

      if (docSnapShot.docs.isEmpty) {
        final docSnapshot2 = await cropRef
            .where('nameEn', isGreaterThanOrEqualTo: keyword)
            .get();

        final data = docSnapshot2.docs.map((e) => e.data()).toList();
        return data;
      }

      final data = docSnapShot.docs.map((e) => e.data()).toList();
      return data;
    });
  }
}
