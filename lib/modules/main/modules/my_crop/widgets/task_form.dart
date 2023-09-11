import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../global/data/models/crop_task/preparation.dart';
import '../../../../../global/data/models/crop_task/suggestion_task.dart';
import '../../../../../global/gen/strings.g.dart';
import '../../../../../global/themes/app_colors.dart';
import '../../../../../global/utils/app_icons.dart';
import '../../../../../global/widgets/shimmer/shimmer_image.dart';
import '../modules/upsert/providers/crop_task_provider.dart';

class TaskForm extends ConsumerStatefulWidget {
  const TaskForm({super.key});

  @override
  ConsumerState<TaskForm> createState() => _TaskFormState();
}

class _TaskFormState extends ConsumerState<TaskForm> {
  List<Preparation> selectedPrepare = [];
  List<SuggestionTask> selectedTasks = [];

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final transl = Translations.of(context);
    bool isEn = LocaleSettings.currentLocale == AppLocale.en;

    return Container(
      margin: const EdgeInsets.only(top: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: AppColors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                transl.upsertMyCrop.allTask,
                style: textTheme.titleSmall,
              ),
              GestureDetector(
                onTap: () {
                  // TODOs: ...
                },
                child: Row(
                  children: [
                    const Icon(AppIcons.edit, size: 20),
                    const SizedBox(width: 4),
                    Text(transl.common.button.add),
                  ],
                ),
              )
            ],
          ),
          const SizedBox(height: 8),
          Text(
            '1. ${transl.upsertMyCrop.yourPreparation}',
            style: const TextStyle(
              fontWeight: FontWeight.w500,
            ),
          ),
          ref.watch(preparationProvider).when(
                data: (data) {
                  return FormBuilderField(
                    name: 'preparation',
                    builder: (field) {
                      return Column(
                          children: data.map((e) {
                        bool selected = selectedPrepare.contains(e);
                        return CheckboxListTile(
                          title: Text(
                            isEn ? e.nameEn ?? '' : e.nameVi ?? '_',
                          ),
                          secondary: ShimmerImage(
                            imageUrl: e.thumbnail ?? '',
                            height: 26,
                            fit: BoxFit.contain,
                          ),
                          autofocus: false,
                          activeColor: AppColors.primary,
                          checkColor: AppColors.white,
                          selected: selectedPrepare.contains(e),
                          value: selectedPrepare.contains(e),
                          onChanged: (value) {
                            if (selected) {
                              setState(() {
                                selectedPrepare.remove(e);
                              });
                            } else {
                              setState(() {
                                selectedPrepare.add(e);
                              });
                            }
                            field.didChange(selectedPrepare);
                          },
                        );
                      }).toList());
                    },
                  );
                },
                error: (err, __) => Text('${transl.error.error}: $err'),
                loading: () => const Center(
                  child: CircularProgressIndicator(),
                ),
              ),
          const SizedBox(height: 8),
          Text(
            '2. ${transl.upsertMyCrop.suggestionTask}',
            style: const TextStyle(
              fontWeight: FontWeight.w500,
            ),
          ),
          ref.watch(suggestionTaskProvider).when(
                data: (data) {
                  return FormBuilderField(
                      name: 'suggestionTasks',
                      builder: (field) {
                        return Column(
                            children: data.map((e) {
                          bool selected = selectedTasks.contains(e);
                          return CheckboxListTile(
                            title: Text(
                              isEn ? e.nameEn ?? '' : e.nameVi ?? '_',
                            ),
                            autofocus: false,
                            activeColor: AppColors.primary,
                            checkColor: AppColors.white,
                            selected: selectedTasks.contains(e),
                            value: selectedTasks.contains(e),
                            onChanged: (value) {
                              if (selected) {
                                setState(() {
                                  selectedTasks.remove(e);
                                });
                              } else {
                                setState(() {
                                  selectedTasks.add(e);
                                });
                              }
                              field.didChange(selectedTasks);
                            },
                          );
                        }).toList());
                      });
                },
                error: (err, __) => Text('${transl.error.error}: $err'),
                loading: () => const Center(
                  child: CircularProgressIndicator(),
                ),
              ),
        ],
      ),
    );
  }
}
