import 'package:adaptive_selector/adaptive_selector.dart';
import 'package:flutter/material.dart';

import '../../../global/enum/role_enum.dart';
import '../../../global/gen/strings.g.dart';

class RoleSelector extends StatelessWidget {
  const RoleSelector({
    super.key,
    this.onChanged,
    this.initial,
  });
  final RoleEnum? initial;
  final void Function(RoleEnum? options)? onChanged;

  @override
  Widget build(BuildContext context) {
    final transl = Translations.of(context);

    return AdaptiveSelector<RoleEnum?>(
      initial: initial != null
          ? [
              AdaptiveSelectorOption(
                label: initial!.label(context),
                value: initial!,
              )
            ]
          : [],
      allowClear: false,
      options: RoleEnum.values
          .map(
            (e) => AdaptiveSelectorOption(
              label: e.label(context),
              value: e,
            ),
          )
          .toList(),
      type: SelectorType.menu,
      onChanged: (roleOptions) {
        onChanged?.call(roleOptions.isEmpty ? null : roleOptions.first.value);
      },
      decoration: InputDecoration(
        hintText: transl.profile.role.hint,
      ),
    );
  }
}
