import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../../../global/data/models/crop_task/preparation.dart';
import '../../../../../../../global/data/models/crop_task/suggestion_task.dart';
import '../../../../../../../global/data/repositories/crop_task_repository.dart';

final preparationProvider = FutureProvider<List<Preparation>>((ref) async {
  final cropTaskRepository = ref.read(cropTaskRepositoryProvider);
  final preparation = await cropTaskRepository.getPreparation().then(
        (either) => either.fold(
          (l) => null,
          (r) => r,
        ),
      );

  return preparation ?? [];
});

final suggestionTaskProvider =
    FutureProvider<List<SuggestionTask>>((ref) async {
  final cropTaskRepository = ref.read(cropTaskRepositoryProvider);
  final suggestionTasks = await cropTaskRepository.getSuggestionTasks().then(
        (either) => either.fold(
          (l) => null,
          (r) => r,
        ),
      );

  return suggestionTasks ?? [];
});
