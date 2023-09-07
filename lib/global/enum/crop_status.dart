import 'package:flutter/material.dart';

import '../gen/strings.g.dart';
import '../themes/app_colors.dart';

enum CropStatus {
  completed('completed', 0),
  inprogress('inprogress', 1),
  todo('todo', 2),
  cancel('cancel', 3);

  final String value;
  final int id;
  const CropStatus(this.value, this.id);

  static CropStatus fromValue(String? value) {
    return CropStatus.values.firstWhere(
      (e) => e.value == value,
      orElse: () => todo,
    );
  }

  String statusTitle(BuildContext context) {
    final transl = Translations.of(context);
    switch (this) {
      case completed:
        return transl.myCrops.status[0];
      case inprogress:
        return transl.myCrops.status[1];
      case todo:
        return transl.myCrops.status[2];
      case cancel:
        return transl.myCrops.status[3];
    }
  }

  Color? color() {
    switch (this) {
      case completed:
        return AppColors.errorDefault;
      case inprogress:
        return AppColors.information;
      case todo:
        return AppColors.alertDefault;
      case cancel:
        return AppColors.neutral05;
    }
  }
}
