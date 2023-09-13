import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../../../global/data/models/app_event/app_event.dart';
import '../../../../../../../global/data/models/my_crop/my_crop.dart';
import '../../../../../../../global/enum/crop_status.dart';
import '../../../../../../../global/utils/app_mixin.dart';
import '../../../../../../../global/utils/riverpod/app_state.dart';
import '../../../../../../../global/widgets/empty_data.dart';
import '../../../../crops/widgets/crop_tile.dart';
import '../providers/my_crop_provider.dart';
import 'my_crop_tile.dart';

class MyCropsView extends ConsumerStatefulWidget {
  const MyCropsView({
    super.key,
    required this.cropStatus,
  });

  final CropStatus cropStatus;

  @override
  ConsumerState<MyCropsView> createState() => _MyCropsViewState();
}

class _MyCropsViewState extends ConsumerState<MyCropsView> with AppMixin {
  late StreamSubscription createMyCropSub;
  late AppState<List<MyCrop>?> myCrops;

  @override
  void initState() {
    createMyCropSub = eventBus.on<CreateMyCropEvent>().listen((_) {
      setState(() {
        myCrops = ref.read(myCropProvider(widget.cropStatus));
        print('hello');
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    createMyCropSub.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    myCrops = ref.watch(myCropProvider(widget.cropStatus));
    return myCrops.when(
      initial: () => const SizedBox(),
      loading: () {
        return ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          itemCount: 3,
          itemBuilder: (_, __) {
            return const ShimmerCropTile();
          },
        );
      },
      data: (crops, _) {
        final cropsData = crops ?? [];
        if (cropsData.isEmpty) {
          return const EmptyData();
        }
        return ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          itemCount: crops?.length ?? 0,
          itemBuilder: (_, index) {
            final crop = cropsData[index];
            return MyCropTile(myCrop: crop);
          },
        );
      },
      error: (err) => Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text('Error: $err'),
        ),
      ),
    );
  }
}
