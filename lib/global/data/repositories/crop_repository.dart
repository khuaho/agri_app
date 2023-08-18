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
}

class _CropRepositoryImpl extends BaseRepository implements CropRepository {
  final cropRef =
      FirebaseFirestore.instance.collection('crops').withDocConverter();

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
    print('id: $id');
    return guardFuture(() async {
      await Future.delayed(const Duration(seconds: 1));

      final res = await cropRef.doc('7GHpqTvnr77djcXu1IQV').get();
      if (res.exists) {
        return res.data()!;
      }
      print('res: ${res.data()}');
      return null;
    });
  }
}
