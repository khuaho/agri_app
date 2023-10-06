import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/crop/crop.dart';
import '../models/failures/failure.dart';
import '_base_repository.dart';

final cropRepositoryProvider = Provider(
  (ref) => _CropRepositoryImpl(ref),
);

abstract class CropRepository {
  Future<Either<Failure, List<Crop>>> getCrops();

  // Future<Either<Failure, List<Crop>>> getCropsPagination(Crop? item);

  Future<List<Crop>> fetchCrops(Crop? item);

  // Future<Either<Failure, QuerySnapshot<Crop>>> getCropsPagination2(
  //     {DocumentSnapshot<Crop>? lastDocument});

  Future<Either<Failure, Crop?>> getCrop(String? id);

  Future<Either<Failure, List<Crop>>> searchCropByName(String keyword);

  Future<Either<Failure, List<Crop>>> getCropsByCropType(String cropTypeId);

  Future<Either<Failure, int>> getCropCount();
}

class _CropRepositoryImpl extends BaseRepository implements CropRepository {
  _CropRepositoryImpl(this.ref);
  final Ref ref;
  final cropRef =
      FirebaseFirestore.instance.collection('crops').withCropConverter();

  @override
  Future<Either<Failure, List<Crop>>> getCrops() {
    return guardFuture(() async {
      await Future.delayed(const Duration(seconds: 1));
      final res = await cropRef.get();
      final data = res.docs.map((e) => e.data().copyWith(uid: e.id)).toList();
      return data;
    });
  }

  // @override
  // Future<Either<Failure, List<Crop>>> getCropsPagination(Crop? item) {
  //   return guardFuture(() async {
  //     await Future.delayed(const Duration(seconds: 1));
  //     Query<Crop> querySnapshot =
  //         cropRef.limit(2).orderBy('createdAt', descending: true);
  //     if (item != null) {
  //       querySnapshot = querySnapshot.startAfter([item.createdAt]);
  //     }
  //     final res = await querySnapshot.get();
  //     final data = res.docs.map((e) => e.data().copyWith(uid: e.id)).toList();
  //     return data;
  //   });
  // }

  // @override
  // Future<Either<Failure, QuerySnapshot<Crop>>> getCropsPagination2({
  //   DocumentSnapshot<Crop>? lastDocument,
  // }) {
  //   return guardFuture(() async {
  //     await Future.delayed(const Duration(seconds: 1));
  //     Query<Crop> cropsQuery = cropRef.limit(2);
  //     if (lastDocument != null) {
  //       cropsQuery = cropsQuery.startAfterDocument(lastDocument);
  //     }
  //     final querySnapShot = await cropsQuery.get();

  //     return querySnapShot;
  //   });
  // }

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

  @override
  Future<Either<Failure, List<Crop>>> getCropsByCropType(String cropTypeId) {
    return guardFuture(() async {
      await Future.delayed(const Duration(seconds: 1));
      final res =
          await cropRef.where('cropTypeId', isEqualTo: cropTypeId).get();
      final data = res.docs.map((e) => e.data().copyWith(uid: e.id)).toList();
      return data;
    });
  }

  @override
  Future<Either<Failure, int>> getCropCount() {
    return guardFuture(() async {
      await Future.delayed(const Duration(seconds: 1));
      final query = await cropRef.count().get();

      return query.count;
    });
  }

  @override
  Future<List<Crop>> fetchCrops(Crop? item) async {
    Query<Crop> query =
        cropRef.limit(20).orderBy('createdAt', descending: true);
    if (item != null) {
      query = query.startAfter([item.createdAt]);
    }
    final documentSnapShot = await query.get();

    final data =
        documentSnapShot.docs.map((e) => e.data().copyWith(uid: e.id)).toList();
    return data;
  }
}
