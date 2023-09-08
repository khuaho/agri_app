import 'package:flutter/material.dart';

import '../../../../../global/gen/strings.g.dart';
import '../../../../../global/themes/app_colors.dart';

class OtherButtonTile extends StatefulWidget {
  const OtherButtonTile({
    super.key,
    this.onChanged,
  });

  final void Function(bool)? onChanged;

  @override
  State<OtherButtonTile> createState() => _OtherButtonTileState();
}

class _OtherButtonTileState extends State<OtherButtonTile> {
  bool selectedOther = false;
  @override
  Widget build(BuildContext context) {
    final transl = Translations.of(context);

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedOther = !selectedOther;
          widget.onChanged?.call(selectedOther);
        });
      },
      child: ListTile(
        title: Text(
          transl.upsertMyCrop.cropType.other,
          // style: textTheme.titleSmall,
        ),
        leading: Container(
          height: 16,
          width: 16,
          decoration: const BoxDecoration(
            color: AppColors.primary,
            shape: BoxShape.circle,
          ),
          child: Container(
            margin: const EdgeInsets.all(4),
            decoration: const BoxDecoration(
              color: AppColors.white,
              shape: BoxShape.circle,
            ),
            child: selectedOther
                ? Container(
                    margin: const EdgeInsets.all(2),
                    decoration: const BoxDecoration(
                      color: AppColors.yellow,
                      shape: BoxShape.circle,
                    ),
                  )
                : null,
          ),
        ),
      ),
    );
  }
}
