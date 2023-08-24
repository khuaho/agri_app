import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../global/gen/strings.g.dart';
import '../../../global/themes/app_colors.dart';
import '../../../global/utils/image_helper.dart';

class ImageDialog extends StatefulWidget {
  const ImageDialog({super.key});

  @override
  State<ImageDialog> createState() => _ImageDialogState();
}

class _ImageDialogState extends State<ImageDialog> {
  Future<void> addImage(ImageSource source) async {
    final newImages = await ImageHelper.pickImage(
      context,
      source,
    );

    if (newImages != null && newImages.isNotEmpty) {
      if (mounted) {
        Navigator.of(context).pop(newImages.first);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final transl = Translations.of(context);

    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      insetPadding: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              transl.common.getPhoto,
              style: textTheme.titleMedium?.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: AppColors.primary,
              ),
            ),
            const SizedBox(height: 16),
            Wrap(
              children: [
                GestureDetector(
                  onTap: () => addImage(ImageSource.camera),
                  child: Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                      color: AppColors.neutral09,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.photo_camera,
                          color: AppColors.information,
                        ),
                        const SizedBox(height: 4),
                        Text(transl.common.camera),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                GestureDetector(
                  onTap: () => addImage(ImageSource.gallery),
                  child: Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                      color: AppColors.neutral09,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.photo,
                          color: AppColors.alertDefault,
                        ),
                        const SizedBox(height: 4),
                        Text(transl.common.gallery),
                      ],
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
