import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/failures/failure.dart';
import '../models/post/post.dart';
import '_base_repository.dart';

final postRepositoryProvider = Provider(
  (ref) => _PostRepositoryImpl(),
);

abstract class PostRepository {
  Future<Either<Failure, List<Post>>> getPosts(Post? item);

  Future<List<Post>> fetchPosts(Post? item);
}

class _PostRepositoryImpl extends BaseRepository implements PostRepository {
  final postRef =
      FirebaseFirestore.instance.collection('posts').withPostConverter();

  @override
  Future<List<Post>> fetchPosts(Post? item) async {
    Query<Post> query =
        postRef.limit(10).orderBy('createdAt', descending: true);
    if (item != null) {
      query = query.startAfter([item.createdAt]);
    }
    final documentSnapShot = await query.get();

    final data = documentSnapShot.docs.map((e) => e.data()).toList();
    return data;
  }

  @override
  Future<Either<Failure, List<Post>>> getPosts(Post? item) {
    return guardFuture(() async {
      await Future.delayed(const Duration(seconds: 1));
      Query<Post> query =
          postRef.limit(10).orderBy('createdAt', descending: true);
      if (item != null) {
        query = query.startAfter([item.createdAt]);
      }
      final documentSnapShot = await query.get();

      final data = documentSnapShot.docs.map((e) => e.data()).toList();
      return data;
    });
  }
}
