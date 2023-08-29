import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../data/models/failures/failure.dart';
import '../data/models/user/user.dart';
import '../data/repositories/_base_repository.dart';
import '../utils/constants.dart';

final hiveServiceProvider = Provider(
  (ref) => _HiveServiceImpl(
    Hive.box(Constants.hiveDataBox),
  ),
);

abstract class HiveService {
  Either<Failure, User> getUser();

  Future<Either<Failure, Unit>> saveUser(User user);

  Future<Either<Failure, Unit>> deleteUser();
}

class _HiveServiceImpl extends BaseRepository implements HiveService {
  _HiveServiceImpl(this.box);
  final Box<String> box;

  @override
  Either<Failure, User> getUser() {
    return guard(() {
      final savedUser = box.get(Constants.hiveUserCredentialsKey);
      if (savedUser != null) {
        return User.fromJson(jsonDecode(savedUser));
      }
      return User();
    });
  }

  @override
  Future<Either<Failure, Unit>> deleteUser() {
    return guardFuture(() async {
      box.delete(Constants.hiveUserCredentialsKey);
      return unit;
    });
  }

  @override
  Future<Either<Failure, Unit>> saveUser(User user) {
    return guardFuture(() async {
      box.put(
        Constants.hiveUserCredentialsKey,
        jsonEncode(user.toJson()),
      );
      return unit;
    });
  }
}
