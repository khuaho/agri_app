import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../../global/app_router/app_router.dart';
import '../../../../../../global/data/models/app_event/app_event.dart';
import '../../../../../../global/enum/crop_status.dart';
import '../../../../../../global/gen/assets.gen.dart';
import '../../../../../../global/gen/strings.g.dart';
import '../../../../../../global/themes/app_colors.dart';
import '../../../../../../global/utils/app_icons.dart';
import '../../../../../../global/utils/app_mixin.dart';
import '../../../../../../global/widgets/shadow_wrapper.dart';
import 'providers/check_my_crop_provider.dart';
import 'widgets/my_crops_view.dart';

@RoutePage()
class MyCropsPage extends ConsumerStatefulWidget {
  const MyCropsPage({super.key});

  @override
  ConsumerState<MyCropsPage> createState() => _MyCropsPageState();
}

class _MyCropsPageState extends ConsumerState<MyCropsPage>
    with
        SingleTickerProviderStateMixin,
        AutomaticKeepAliveClientMixin,
        AppMixin {
  late final tabController = TabController(length: 4, vsync: this);
  late StreamSubscription myCropSub;

  @override
  void initState() {
    myCropSub = eventBus.on<CreateMyCropEvent>().listen((_) {
      // ignore: unused_result
      ref.refresh(checkMyCropExistProvider);
    });
    super.initState();
  }

  @override
  void dispose() {
    myCropSub.cancel();
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final transl = Translations.of(context);
    final myCropExist = ref.watch(checkMyCropExistProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(transl.main.myCrops),
        actions: [
          IconButton(
            onPressed: () {
              context.pushRoute(UpsertMyCropRoute());
            },
            icon: const Icon(
              AppIcons.edit,
              color: AppColors.primary,
            ),
          )
        ],
      ),
      body: myCropExist.when(
        data: (result) {
          if (result == false) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Assets.images.garden.image(
                    height: 260,
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  transl.myCrops.haveNotCreateCrop,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 8),
                ElevatedButton.icon(
                  icon: const Icon(
                    AppIcons.seedling,
                    size: 20,
                  ),
                  label: Text(transl.upsertMyCrop.title),
                  onPressed: () {
                    context.pushRoute(UpsertMyCropRoute());
                  },
                ),
              ],
            );
          }

          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ShadowWrapper(
                borderRadius: 0,
                child: TabBar(
                  isScrollable: true,
                  padding: const EdgeInsets.all(16),
                  labelColor: AppColors.primary,
                  controller: tabController,
                  tabs: CropStatus.values
                      .map((e) => Text(e.statusTitle(context)))
                      .toList(),
                ),
              ),
              Expanded(
                child: TabBarView(
                  physics: const NeverScrollableScrollPhysics(),
                  controller: tabController,
                  children: CropStatus.values
                      .map((e) => MyCropsView(cropStatus: e))
                      .toList(),
                ),
              ),
            ],
          );
        },
        error: (err, _) => Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text('${transl.error.error}: $err'),
          ),
        ),
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
