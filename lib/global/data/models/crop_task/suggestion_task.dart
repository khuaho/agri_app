import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'suggestion_task.freezed.dart';
part 'suggestion_task.g.dart';

@freezed
class SuggestionTask with _$SuggestionTask {
  const SuggestionTask._();

  factory SuggestionTask({
    String? uid,
    String? nameEn,
    String? nameVi,
  }) = _SuggestionTask;

  factory SuggestionTask.fromJson(Map<String, dynamic> json) =>
      _$SuggestionTaskFromJson(json);
}

extension SuggestionTaskConverter on CollectionReference {
  CollectionReference<SuggestionTask> withSuggestionTaskConverter() {
    return withConverter(
      fromFirestore: (snapshot, _) => SuggestionTask.fromJson(snapshot.data()!),
      toFirestore: (suggestionTask, _) => suggestionTask.toJson(),
    );
  }
}
