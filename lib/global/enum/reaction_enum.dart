import 'package:flutter/material.dart';

import '../gen/strings.g.dart';
import '../themes/app_colors.dart';
import '../utils/app_icons.dart';

enum ReactionEnum {
  like('like'),
  favorite('favorite'),
  satisfied('satisfied'),
  unsatisfied('unsatisfied');

  final String value;
  const ReactionEnum(this.value);

  static ReactionEnum fromValue(String? value) {
    return ReactionEnum.values.firstWhere(
      (e) => e.value == value,
      orElse: () => like,
    );
  }

  String reactionTitle(BuildContext context) {
    final transl = Translations.of(context);
    switch (this) {
      case like:
        return transl.common.reaction.like;
      case favorite:
        return transl.common.reaction.favorite;
      case satisfied:
        return transl.common.reaction.satisfied;
      case unsatisfied:
        return transl.common.reaction.unsatisfied;
    }
  }

  IconData icon() {
    switch (this) {
      case like:
        return AppIcons.thumbs_up;
      case favorite:
        return AppIcons.favorite;
      case satisfied:
        return AppIcons.smile;
      case unsatisfied:
        return AppIcons.frown;
    }
  }

  Color? bgIcon() {
    switch (this) {
      case like:
        return AppColors.information;
      case favorite:
        return AppColors.errorDefault;
      case satisfied:
        return AppColors.alertDefault;
      case unsatisfied:
        return AppColors.neutral05;
    }
  }
}
