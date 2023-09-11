import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/crop_task/preparation.dart';
import '../models/crop_task/suggestion_task.dart';
import '../models/failures/failure.dart';
import '_base_repository.dart';

final cropTaskRepositoryProvider = Provider(
  (ref) => _CropTaskRepositoryImpl(),
);

abstract class CropTaskRepository {
  Future<Either<Failure, List<Preparation>>> getPreparation();

  Future<Either<Failure, List<SuggestionTask>>> getSuggestionTasks();
}

class _CropTaskRepositoryImpl extends BaseRepository
    implements CropTaskRepository {
  final preparationRef = FirebaseFirestore.instance
      .collection('preparation')
      .withPreparationConverter();

  final suggestionTaskRef = FirebaseFirestore.instance
      .collection('suggestionTasks')
      .withSuggestionTaskConverter();

  @override
  Future<Either<Failure, List<Preparation>>> getPreparation() {
    return guardFuture(() async {
      await Future.delayed(const Duration(seconds: 1));
      final res = await preparationRef.get();
      final data = res.docs.map((e) => e.data().copyWith(uid: e.id)).toList();
      return data;
    });
  }

  @override
  Future<Either<Failure, List<SuggestionTask>>> getSuggestionTasks() {
    return guardFuture(() async {
      await Future.delayed(const Duration(seconds: 1));
      final res = await suggestionTaskRef.get();
      final data = res.docs.map((e) => e.data().copyWith(uid: e.id)).toList();
      return data;
    });
  }
}
