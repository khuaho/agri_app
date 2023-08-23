import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart';

import '../models/failures/failure.dart';
import '_base_repository.dart';

final fileRepositoryProvider = Provider(
  (ref) => _FileRepositoryImpl(),
);

abstract class FileRepository {
  /// Return list of file path
  Future<Either<Failure, String>> uploadFile({
    required String docId,
    required File file,
  });

  Future<Either<Failure, List<UploadFileTask>>> uploadFiles({
    required String docId,
    required List<File> files,
  });
}

class _FileRepositoryImpl extends BaseRepository implements FileRepository {
  final storageRef = FirebaseStorage.instance.ref();

  @override
  Future<Either<Failure, String>> uploadFile({
    required String docId,
    required File file,
  }) {
    return guardFuture(() async {
      final uid = FirebaseAuth.instance.currentUser?.uid;

      final docRef = storageRef.child(
        '$uid/docs/$docId/${basename(file.path)}',
      );
      final byteData = await file.readAsBytes();
      await docRef.putData(byteData);

      return docRef.fullPath;
    });
  }

  @override
  Future<Either<Failure, List<UploadFileTask>>> uploadFiles({
    required String docId,
    required List<File> files,
  }) {
    List<UploadFileTask> uploadTaskList = [];

    return guardFuture(() async {
      final uid = FirebaseAuth.instance.currentUser?.uid;

      for (var file in files) {
        final docRef = storageRef.child(
          '$uid/docs/$docId/${basename(file.path)}',
        );
        final byteData = await file.readAsBytes();
        uploadTaskList.add(
          UploadFileTask(
            docRef.putData(byteData),
            byteData.length,
          ),
        );
      }
      return uploadTaskList;
    });
  }
}

class UploadFileTask {
  final UploadTask task;
  final int totalBytes;

  UploadFileTask(this.task, this.totalBytes);
}
