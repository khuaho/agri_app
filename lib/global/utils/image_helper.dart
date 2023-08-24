import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

import '../data/models/failures/failure.dart';
import '../gen/strings.g.dart';
import '../themes/app_colors.dart';
import 'permission_helper.dart';
import 'snack_bar.dart';

class ImageHelper {
  const ImageHelper._();

  static Future<List<String>?> pickImage(
    BuildContext context,
    ImageSource source,
  ) async {
    return source == ImageSource.camera
        ? takeAPicture(context)
        : selectFromGallery(context);
  }

  static Future<List<String>?> takeAPicture(
    BuildContext context, [
    bool enableCropper = true,
  ]) async {
    final isGranted = await PermissionHelper.request(
      PermissionTarget.camera,
      context,
    );
    if (!isGranted) return null;

    try {
      final picker = ImagePicker();
      final pickedImage = await picker.pickImage(
        source: ImageSource.camera,
        preferredCameraDevice: CameraDevice.rear,
      );
      if (pickedImage != null && context.mounted) {
        if (enableCropper) {
          final croppedImage = await launchImageCropper(
            context,
            pickedImage.path,
          );
          if (croppedImage != null) {
            return [croppedImage];
          }
        } else {
          return [pickedImage.path];
        }
      }
    } catch (e) {
      if (context.mounted) {
        SnackBarUtils.showErr(context, Failure.unknown(e));
      }
    }
    return null;
  }

  static Future<List<String>?> selectFromGallery(BuildContext context) async {
    final isGranted = await PermissionHelper.request(
      PermissionTarget.readPhoto,
      context,
    );
    if (!isGranted) return null;

    try {
      final picker = ImagePicker();
      final newPickedImages = await picker.pickMultiImage();
      if (newPickedImages.isNotEmpty) {
        return newPickedImages.map((e) => e.path).toList();
      }
    } catch (e) {
      if (context.mounted) {
        SnackBarUtils.showErr(context, Failure.unknown(e));
      }
    }
    return null;
  }

  static Future<String?> launchImageCropper(
      BuildContext context, String imagePath) async {
    final transl = Translations.of(context);

    final croppedFile = await ImageCropper().cropImage(
      sourcePath: imagePath,
      aspectRatioPresets: [
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio16x9,
      ],
      uiSettings: [
        AndroidUiSettings(
          toolbarTitle: transl.common.button.edit,
          toolbarColor: AppColors.primary,
          toolbarWidgetColor: Colors.white,
          initAspectRatio: CropAspectRatioPreset.original,
          lockAspectRatio: false,
        ),
        IOSUiSettings(
          title: transl.common.button.edit,
        ),
      ],
    );
    return croppedFile?.path;
  }
}
