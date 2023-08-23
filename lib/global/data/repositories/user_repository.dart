import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart' as fb;

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/failures/failure.dart';

import '../models/user/user.dart';
import '_base_repository.dart';

final userRepositoryProvider = Provider(
  (ref) => _UserRepositoryImpl(),
);

abstract class UserRepository {
  Future<Either<Failure, User>> getMe();

  Future<Either<Failure, Unit>> addUser(Map<String, dynamic> data);
}

class _UserRepositoryImpl extends BaseRepository implements UserRepository {
  final userRef =
      FirebaseFirestore.instance.collection('users').withUserConverter();

  @override
  Future<Either<Failure, User>> getMe() {
    return guardFuture(() async {
      final uid = fb.FirebaseAuth.instance.currentUser?.uid;
      final res = await userRef.doc(uid).get();
      return res.data()!;
    });
  }

  @override
  Future<Either<Failure, Unit>> addUser(Map<String, dynamic> data) {
    return guardFuture(() async {
      final uid = fb.FirebaseAuth.instance.currentUser?.uid;
      final user = User(
        uid: uid,
        username: data['username'],
        fullName: data['fullName'],
        email: data['email'],
      );

      await userRef.doc(uid).set(user);
      return unit;
    });
  }
}
