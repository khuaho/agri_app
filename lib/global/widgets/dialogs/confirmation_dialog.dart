import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../gen/strings.g.dart';
import '../../themes/app_colors.dart';
import '../../utils/app_icons.dart';

class ConfirmationDialog extends StatelessWidget {
  const ConfirmationDialog({
    super.key,
    required this.title,
    this.content,
    required this.onTapOk,
    this.onTapCancel,
    this.okText,
    this.cancelText,
  });

  final String title;
  final String? content;
  final String? okText;
  final String? cancelText;
  final VoidCallback onTapOk;
  final VoidCallback? onTapCancel;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final transl = Translations.of(context);

    return AlertDialog(
      insetPadding: const EdgeInsets.all(30),
      contentPadding: const EdgeInsets.all(24),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      ),
      content: SizedBox(
        width: MediaQuery.of(context).size.width * 0.85 > 400
            ? 400
            : MediaQuery.of(context).size.width * 0.85,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(
              AppIcons.flowers,
              size: 72,
              color: AppColors.errorDefault,
            ),
            const SizedBox(height: 10),
            Text(
              title,
              style: textTheme.titleLarge,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 6),
            if (content != null)
              Text(
                content ?? '_',
                style: textTheme.bodyLarge?.copyWith(
                  color: AppColors.neutral03,
                ),
                textAlign: TextAlign.center,
              ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: onTapCancel ?? AutoRouter.of(context).pop,
                    child: Text(
                      cancelText ?? transl.common.button.cancel,
                    ),
                  ),
                ),
                const SizedBox(width: 18),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      AutoRouter.of(context).pop();
                      onTapOk();
                    },
                    child: Text(
                      okText ?? transl.common.button.ok,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
