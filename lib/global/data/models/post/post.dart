import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../converters/timestamp_converter.dart';

part 'post.freezed.dart';
part 'post.g.dart';

@freezed
class Post with _$Post {
  const Post._();

  factory Post({
    String? id,
    String? content,
    @TimestampOrNullConverter() DateTime? createdAt,
  }) = _Post;

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);
}

extension PostConverter on CollectionReference {
  CollectionReference<Post> withPostConverter() {
    return withConverter(
      fromFirestore: (snapshot, _) => Post.fromJson(snapshot.data()!),
      toFirestore: (post, _) => post.toJson(),
    );
  }
}
