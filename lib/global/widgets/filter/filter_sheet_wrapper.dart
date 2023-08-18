import 'package:flutter/material.dart';

import '../../gen/strings.g.dart';
import '../../themes/app_colors.dart';

class FilterSheetWrapper extends StatelessWidget {
  const FilterSheetWrapper({
    Key? key,
    required this.onClearAll,
    required this.onApply,
    required this.children,
  }) : super(key: key);

  final VoidCallback onClearAll;
  final VoidCallback onApply;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    final transl = Translations.of(context);

    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 16, 16, 4),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    transl.common.filter,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                IconButton(
                  onPressed: Navigator.of(context).pop,
                  icon: const Icon(
                    Icons.close,
                    color: AppColors.neutral05,
                    size: 22,
                  ),
                ),
              ],
            ),
          ),
          const Divider(color: AppColors.neutral05),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: [
                const SizedBox(height: 8),
                ...children,
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: onClearAll,
                    child: Text(transl.common.button.reset),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton(
                    onPressed: onApply,
                    child: Text(transl.common.button.apply),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
