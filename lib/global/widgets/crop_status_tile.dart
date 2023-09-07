import 'package:flutter/widgets.dart';

import '../enum/crop_status.dart';
import '../utils/app_icons.dart';

class CropStatusTile extends StatelessWidget {
  const CropStatusTile({super.key, this.cropStatus});

  final CropStatus? cropStatus;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Icon(
          AppIcons.certificate,
          size: 8,
          color: cropStatus?.color(),
        ),
        const SizedBox(width: 6),
        Text(
          cropStatus?.statusTitle(context) ?? '_',
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: cropStatus?.color(),
          ),
        ),
      ],
    );
  }
}
