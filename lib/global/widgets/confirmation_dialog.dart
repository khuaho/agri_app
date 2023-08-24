import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../gen/strings.g.dart';
import '../themes/app_colors.dart';
import '../utils/app_icons.dart';

// import '../../gen/i18n.dart';
// import '../../themes/app_colors.dart';
// import '../../utils/app_icons.dart';

class ConfirmationDialog extends StatelessWidget {
  const ConfirmationDialog({
    super.key,
    this.titleText,
    this.contentText,
    this.title,
    this.content,
    this.positiveButtonText,
    required this.onTapPositiveButton,
    this.negativeButtonText,
    required this.onTapNegativeButton,
    this.image,
  });

  final String? titleText;
  final String? contentText;
  final Widget? title;
  final Widget? content;
  final String? positiveButtonText;
  final VoidCallback onTapPositiveButton;
  final String? negativeButtonText;
  final VoidCallback onTapNegativeButton;
  final Widget? image;

  @override
  Widget build(BuildContext context) {
    final transl = Translations.of(context);

    return Dialog(
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 24),
                Center(
                  child: SizedBox.square(
                    dimension: 70,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(1000),
                      child: Container(
                        color: AppColors.primary,
                        alignment: Alignment.center,
                        child: image ??
                            const Icon(
                              AppIcons.smile,
                              color: AppColors.white,
                            ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                if (titleText != null)
                  Text(
                    titleText!,
                    style: const TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.w500,
                    ),
                  )
                else if (title != null)
                  title!,
                const SizedBox(height: 16),
                if (content != null)
                  content!
                else if (contentText != null)
                  Text(
                    contentText!,
                    style: const TextStyle(
                      fontSize: 15,
                    ),
                  ),
                const SizedBox(height: 18),
                Row(
                  children: [
                    Expanded(
                      child: FilledButton(
                        onPressed: onTapNegativeButton,
                        style: FilledButton.styleFrom(
                          backgroundColor: AppColors.neutral04.withOpacity(0.7),
                        ),
                        child: Text(
                            negativeButtonText ?? transl.common.button.cancel),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: FilledButton(
                        onPressed: onTapPositiveButton,
                        child:
                            Text(positiveButtonText ?? transl.common.button.ok),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            top: 8,
            right: 8,
            child: IconButton(
              onPressed: context.popRoute,
              icon: const Icon(
                Icons.close,
                color: AppColors.neutral02,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
