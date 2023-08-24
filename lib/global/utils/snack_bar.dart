import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../data/models/failures/failure.dart';
import '../gen/strings.g.dart';
import '../themes/app_colors.dart';

class SnackBarUtils {
  SnackBarUtils._();

  static void showErr(
    BuildContext context,
    Failure err, {
    String Function(FirebaseException)? firebase,
    String Function(Object data)? unknown,
    String Function(Object data)? illegalData,
  }) {
    final transl = Translations.of(context);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: AppColors.errorDefault,
        content: Row(
          children: [
            const Icon(
              Icons.error_outline_outlined,
              color: Colors.white,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                err.when(
                  //TODO: mapping firebase err to string
                  firebase: firebase ?? (exception) => exception.code,
                  unknown: unknown ?? (_) => transl.error.unknown,
                  illegalData: illegalData ?? (_) => transl.error.unknown,
                  network: () => transl.error.noNetwork,
                  permissionDenied: () => transl.error.permissionDenied,
                  other: (message) => message,
                ),
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  static void showSuccess(
    BuildContext context,
    String message,
  ) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: AppColors.successDefault,
        content: Row(
          children: [
            const Icon(
              Icons.check_circle_outline,
              color: Colors.white,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                message,
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  static void showWarning(
    BuildContext context,
    String message,
  ) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: AppColors.warningDefault,
        content: Row(
          children: [
            const Icon(
              Icons.info_outline,
              color: Colors.white,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                message,
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  static void showInfo(
    BuildContext context,
    String message,
  ) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: AppColors.information,
        content: Row(
          children: [
            const Icon(
              Icons.info_outline,
              color: Colors.white,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                message,
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
