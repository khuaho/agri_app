import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/crop_type/crop_type.dart';
import '../models/failures/failure.dart';
import '_base_repository.dart';

final cropTypeRepositoryProvider = Provider(
  (ref) => _CropTypeRepositoryImpl(),
);

abstract class CropTypeRepository {
  Future<Either<Failure, List<CropType>>> getCropTypes();
}

class _CropTypeRepositoryImpl extends BaseRepository
    implements CropTypeRepository {
  final docRef = FirebaseFirestore.instance
      .collection('crop_types')
      .withCropTypeConverter();

  @override
  Future<Either<Failure, List<CropType>>> getCropTypes() {
    return guardFuture(() async {
      await Future.delayed(const Duration(seconds: 1));
      final res = await docRef.get();
      final data = res.docs.map((e) => e.data()).toList();

      return data;
    });
  }
}
