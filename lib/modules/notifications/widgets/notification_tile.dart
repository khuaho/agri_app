import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart' hide Notification;
import '../../../global/app_router/app_router.dart';
import '../../../global/data/models/notification/notification.dart';
import '../../../global/gen/strings.g.dart';
import '../../../global/themes/app_colors.dart';
import '../../../global/utils/app_icons.dart';

class NotificationTile extends StatelessWidget {
  const NotificationTile({
    super.key,
    required this.data,
  });

  final Notification data;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    bool isEn = LocaleSettings.currentLocale == AppLocale.en;
    final content = isEn ? data.content['en'] : data.content['vi'];

    return GestureDetector(
      onTap: () async {
        AutoRouter.of(context).navigate(const CropsRoute()).then(
              (_) => context.pushRoute(
                CropDetailRoute(id: data.cropId!),
              ),
            );
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: data.isRead ? null : AppColors.successSoft,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: const BoxDecoration(
                color: AppColors.alertSoft,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                AppIcons.daisy,
                size: 22,
                color: AppColors.alertDefault,
              ),
            ),
            const SizedBox(width: 6),
            Expanded(
              child: RichText(
                text: TextSpan(
                  text: '${data.userReactedName} ',
                  style: textTheme.titleSmall,
                  children: [
                    TextSpan(
                      text: content,
                      style: textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w400,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
