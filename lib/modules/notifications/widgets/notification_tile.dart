import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart' hide Notification;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../global/app_router/app_router.dart';
import '../../../global/data/models/notification/notification.dart';
import '../../../global/extensions/date_time_ext.dart';
import '../../../global/gen/strings.g.dart';
import '../../../global/themes/app_colors.dart';
import '../../../global/utils/app_icons.dart';
import '../provider/notification_provider.dart';

class NotificationTile extends ConsumerStatefulWidget {
  const NotificationTile({
    super.key,
    required this.data,
  });

  final Notification data;

  @override
  ConsumerState<NotificationTile> createState() => _NotificationTileState();
}

class _NotificationTileState extends ConsumerState<NotificationTile> {
  Future<void> handleReadNotification() async {
    final notiProvider = ref.read(asyncNotificationProvider.notifier);
    if (widget.data.isRead == false) {
      await notiProvider.upsertNotification(
        widget.data.copyWith(isRead: true),
      );
    }
    if (mounted) {
      AutoRouter.of(context).navigate(const CropsRoute()).then(
            (_) => context.pushRoute(
              CropDetailRoute(id: widget.data.cropId!),
            ),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    bool isEn = LocaleSettings.currentLocale == AppLocale.en;
    final content =
        isEn ? widget.data.content['en'] : widget.data.content['vi'];

    return GestureDetector(
      onTap: handleReadNotification,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: widget.data.isRead ? null : AppColors.successSoft,
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
                color: AppColors.alertDefault,
              ),
            ),
            const SizedBox(width: 6),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      text: '${widget.data.userReactedName} ',
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
                  const SizedBox(height: 4),
                  Text(
                    widget.data.createdAt?.timeAgoCustom(context) ?? '_',
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: AppColors.primary,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
