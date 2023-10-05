import 'dart:io';

import 'package:agri_app/global/data/repositories/auth_repository.dart';
import 'package:agri_app/global/data/repositories/user_repository.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mocktail/mocktail.dart';

// Mock
class MockNavigatorObserver extends Mock implements NavigatorObserver {}

class MockFirebaseApp extends Mock implements FirebaseApp {}

class MockUserRepositoryImpl extends Mock implements UserRepositoryImpl {}

class MockAuthRepositoryImpl extends Mock implements AuthRepositoryImpl {}

class MockFile extends Mock implements File {}

// a generic Listener class, used to keep track of when a provider notifies its listeners
class Listener<T> extends Mock {
  void call(T? previous, T next);
}

// Fake
class FakeRoute extends Fake implements Route {}

class FakeBuildContext extends Fake implements BuildContext {}
