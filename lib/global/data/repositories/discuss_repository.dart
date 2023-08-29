import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/discuss/discuss.dart';
import '../models/failures/failure.dart';
import '_base_repository.dart';

final discussRepositoryProvider =
    Provider.family<_DiscussRepositoryImpl, String>(
  (ref, cropId) {
    return _DiscussRepositoryImpl(cropId);
  },
);

abstract class DiscussRepository {
  Future<Either<Failure, List<Discuss>>> getDiscuss();

  Future<Either<Failure, Unit>> addDiscuss(Discuss data);

  Future<Either<Failure, Unit>> deleteDiscuss(String id);

  Future<Either<Failure, Unit>> changedReaction(Discuss data);
}

class _DiscussRepositoryImpl extends BaseRepository
    implements DiscussRepository {
  _DiscussRepositoryImpl(this.cropId);
  final String cropId;

  @override
  Future<Either<Failure, List<Discuss>>> getDiscuss() {
    final discussRef = FirebaseFirestore.instance
        .collection('crops')
        .doc(cropId)
        .collection('discuss')
        .withDiscussConverter();

    return guardFuture(() async {
      await Future.delayed(const Duration(seconds: 1));
      final res = await discussRef.get();
      final data = res.docs.map((e) => e.data().copyWith(uid: e.id)).toList();

      return data;
    });
  }

  @override
  Future<Either<Failure, Unit>> addDiscuss(Discuss data) {
    final discussRef = FirebaseFirestore.instance
        .collection('crops')
        .doc(cropId)
        .collection('discuss')
        .withDiscussConverter();

    return guardFuture(() async {
      await Future.delayed(const Duration(seconds: 1));
      await discussRef.add(data);

      return unit;
    });
  }

  @override
  Future<Either<Failure, Unit>> deleteDiscuss(String id) {
    final discussRef = FirebaseFirestore.instance
        .collection('crops')
        .doc(cropId)
        .collection('discuss')
        .withDiscussConverter();

    return guardFuture(() async {
      await Future.delayed(const Duration(seconds: 1));
      await discussRef.doc(id).delete();

      return unit;
    });
  }

  @override
  Future<Either<Failure, Unit>> changedReaction(Discuss data) {
    final discussRef = FirebaseFirestore.instance
        .collection('crops')
        .doc(cropId)
        .collection('discuss')
        .withDiscussConverter();

    return guardFuture(() async {
      await Future.delayed(const Duration(seconds: 1));
      await discussRef.doc(data.uid).update(data.toJson());

      return unit;
    });
  }
}
