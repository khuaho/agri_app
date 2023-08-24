import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:app_settings/app_settings.dart' as settings;

import '../gen/strings.g.dart';
import '../widgets/confirmation_dialog.dart';

enum PermissionTarget { camera, readPhoto, writePhoto }

class PermissionHelper {
  const PermissionHelper._();

  static void showOpenSettingsDialog(
    BuildContext context,
    PermissionTarget target,
  ) {
    final transl = Translations.of(context);

    var androidMsg = '';
    var iosMsg = '';

    switch (target) {
      case PermissionTarget.camera:
        androidMsg = transl.common.permission_.cameraMsgAndroid;
        iosMsg = transl.common.permission_.cameraMsgIos;
        break;
      case PermissionTarget.readPhoto:
      case PermissionTarget.writePhoto:
        androidMsg = transl.common.permission_.photoMsgAndroid;
        iosMsg = transl.common.permission_.photoMsgIos;
        break;
      default:
    }

    showDialog(
      context: context,
      builder: (dialogContext) => ConfirmationDialog(
        titleText: transl.common.oops,
        contentText: Platform.isAndroid ? androidMsg : iosMsg,
        positiveButtonText: transl.common.button.openSettings,
        onTapPositiveButton: () {
          settings.AppSettings.openAppSettings(
              // callback: Navigator.of(context).pop,
              );
        },
        onTapNegativeButton: Navigator.of(context).pop,
      ),
    );
  }

  /// Provide `context` if you want to show open settings dialog
  static Future<bool> request(
    PermissionTarget target,
    BuildContext? context,
  ) async {
    final permission = await getPermission(target);
    final status = await permission.status;

    switch (status) {
      case PermissionStatus.granted:
      case PermissionStatus.limited:
      case PermissionStatus.provisional:
        return true;
      case PermissionStatus.denied:
        return permission.request().isGranted;
      case PermissionStatus.restricted:
      case PermissionStatus.permanentlyDenied:
        if (context != null && context.mounted) {
          showOpenSettingsDialog(context, target);
        }
        return false;
    }
  }

  static Future<Permission> getPermission(PermissionTarget target) async {
    switch (target) {
      case PermissionTarget.camera:
        return Permission.camera;
      case PermissionTarget.writePhoto:
        if (Platform.isAndroid) {
          if ((await DeviceInfoPlugin().androidInfo).version.sdkInt <= 32) {
            return Permission.storage;
          } else {
            return Permission.photos;
          }
        } else {
          return Permission.photosAddOnly;
        }
      case PermissionTarget.readPhoto:
        if (Platform.isAndroid &&
            (await DeviceInfoPlugin().androidInfo).version.sdkInt <= 32) {
          return Permission.storage;
        } else {
          return Permission.photos;
        }
    }
  }
}
