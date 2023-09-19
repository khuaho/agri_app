import 'package:flutter/material.dart';

import '../../../global/data/models/crop/crop.dart';
import '../../../global/gen/strings.g.dart';
import '../../../global/themes/app_colors.dart';
import '../../../global/widgets/shimmer/shimmer_image.dart';

class PlantingGuide extends StatelessWidget {
  const PlantingGuide({super.key, this.crop});

  final Crop? crop;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final transl = Translations.of(context);
    final titleStyle = textTheme.titleSmall?.copyWith(
      color: AppColors.primary,
    );
    bool isEn = LocaleSettings.currentLocale == AppLocale.en;
    final plantingSeason =
        isEn ? crop?.plantingSeasonEn : crop?.plantingSeasonVi;
    final landForPlating =
        isEn ? crop?.landForPlantingEn : crop?.landForPlantingVi;
    final seedIncubation =
        isEn ? crop?.seedIncubationEn : crop?.seedIncubationVi;
    final howToGrow = isEn ? crop?.growEn : crop?.growVi;

    return ListView(
      children: [
        const SizedBox(height: 10),
        Text(
          '1. ${transl.detailCrop.plantingSeason}',
          style: titleStyle,
        ),
        if (plantingSeason != null) _contentList(plantingSeason),
        const SizedBox(height: 6),
        Text(
          '2. ${transl.detailCrop.prepareSupplies}',
          style: titleStyle,
        ),
        const SizedBox(height: 6),
        Text(
          '* ${transl.detailCrop.landForPlanting}',
          style: titleStyle,
        ),
        if (landForPlating != null) _contentList(landForPlating),
        if (crop?.plantingPotEn != null) ...[
          const SizedBox(height: 4),
          Text(
            '* ${transl.detailCrop.plantingPot}',
            style: titleStyle,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Text(
              isEn ? crop?.plantingPotEn ?? '' : crop?.plantingPotVi ?? '',
            ),
          ),
        ],
        const SizedBox(height: 4),
        Text(
          '* ${transl.detailCrop.seedIncubation}',
          style: titleStyle,
        ),
        if (seedIncubation != null) _contentList(seedIncubation),
        if (crop?.seedThumbnail != null)
          ShimmerImage(
            imageUrl: crop?.seedThumbnail ?? '',
            fit: BoxFit.contain,
            height: 180,
          ),
        const SizedBox(height: 6),
        Text(
          '3. ${transl.detailCrop.howToGrow}',
          style: titleStyle,
        ),
        if (howToGrow != null) _contentList(howToGrow),
        const SizedBox(height: 6),
        Text(
          '4. ${transl.detailCrop.plantCare}',
          style: titleStyle,
        ),
        const SizedBox(height: 4),
        RichText(
          text: TextSpan(
            text: '- ${transl.detailCrop.watering}: ',
            style: textTheme.titleSmall,
            children: [
              TextSpan(
                text: isEn ? crop?.wateringEn ?? '' : crop?.wateringVi ?? '',
                style: textTheme.bodyMedium,
              )
            ],
          ),
        ),
        const SizedBox(height: 4),
        RichText(
          text: TextSpan(
            text: '- ${transl.detailCrop.manure}: ',
            style: textTheme.titleSmall,
            children: [
              TextSpan(
                text: isEn ? crop?.manureEn ?? '' : crop?.manureVi ?? '',
                style: textTheme.bodyMedium,
              )
            ],
          ),
        ),
        const SizedBox(height: 4),
        RichText(
          text: TextSpan(
            text: '- ${transl.detailCrop.weeding}: ',
            style: textTheme.titleSmall,
            children: [
              TextSpan(
                text: isEn ? crop?.weedingEn ?? '' : crop?.weedingVi ?? '',
                style: textTheme.bodyMedium,
              )
            ],
          ),
        ),
      ],
    );
  }

  _contentList(List<String> contents) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: contents
          .map(
            (e) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Text('- $e'),
            ),
          )
          .toList(),
    );
  }
}
