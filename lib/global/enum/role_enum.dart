import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

import '../gen/strings.g.dart';

enum RoleEnum {
  farmer('farmer'),
  expert('expert');

  final String value;
  const RoleEnum(this.value);

  static RoleEnum? fromValue(String? value) {
    return RoleEnum.values.firstWhereOrNull((e) => e.value == value);
  }

  String label(BuildContext context) {
    final transl = Translations.of(context);
    switch (this) {
      case farmer:
        return transl.profile.role.farmer;
      case expert:
        return transl.profile.role.expert;
    }
  }
}
