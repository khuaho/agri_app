import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/adapters.dart';

import '../../utils/constants.dart';
import '../models/app_settings/app_settings.dart';
import '../models/failures/failure.dart';
import '_base_repository.dart';

final appSettingsRepositoryProvider = Provider((ref) {
  return _AppSettingRepositoryImpl(
    Hive.box(Constants.hiveDataBox),
  );
});

abstract class AppSettingsRepository {
  Either<Failure, AppSettings> getAppSettings();

  Future<Either<Failure, AppSettings>> save(AppSettings appSettings);

  Future<Either<Failure, AppSettings>> reset();
}

class _AppSettingRepositoryImpl extends BaseRepository
    implements AppSettingsRepository {
  _AppSettingRepositoryImpl(this.box);

  final Box<String> box;
  final String key = Constants.hiveAppSettingsKey;

  @override
  Either<Failure, AppSettings> getAppSettings() {
    return guard(() {
      final savedAppSettings = box.get(key);
      if (savedAppSettings != null) {
        return AppSettings.fromJson(jsonDecode(savedAppSettings));
      }
      return const AppSettings();
    });
  }

  @override
  Future<Either<Failure, AppSettings>> reset() {
    return guardFuture(() async {
      const defaultData = AppSettings();
      await box.put(
        key,
        jsonEncode(defaultData.toJson),
      );
      return defaultData;
    });
  }

  @override
  Future<Either<Failure, AppSettings>> save(AppSettings appSettings) {
    return guardFuture(() async {
      await box.put(
        key,
        jsonEncode(
          appSettings.toJson(),
        ),
      );
      return appSettings;
    });
  }
}
