import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../global/app_router/app_router.dart';
import '../../global/gen/assets.gen.dart';
import '../../global/gen/strings.g.dart';
import '../../global/themes/app_colors.dart';

@RoutePage()
class OnboardingPage extends ConsumerStatefulWidget {
  const OnboardingPage({super.key});

  @override
  ConsumerState<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends ConsumerState<OnboardingPage> {
  final pageController = PageController();
  bool isLastPage = false;
  int currentPage = 0;

  List<AssetGenImage> onboardImages = [
    Assets.images.onboarding1,
    Assets.images.onboarding2,
    Assets.images.onboarding3,
  ];

  void onPageViewChange(int page) {
    setState(() {
      currentPage = page;
      isLastPage = page == onboardImages.length - 1;
    });
  }

  void nextPageChange() {
    if (!isLastPage) {
      pageController.animateToPage(
        currentPage + 1,
        duration: const Duration(seconds: 1),
        curve: Curves.easeInOut,
      );
    } else {
      print('last page');
      context.router.replaceAll(
        [const HomeRoute()],
      );
      // if (!mounted) return;
      // ref.watch(appSettingProvider.notifier).update(
      //       (state) => state.copyWith(isFirstLaunch: false),
      //     );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView(
              physics: const ClampingScrollPhysics(),
              controller: pageController,
              onPageChanged: onPageViewChange,
              children: List.generate(
                onboardImages.length,
                (index) => page(context, index),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 40,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SmoothPageIndicator(
                  controller: pageController,
                  count: onboardImages.length,
                  effect: const ExpandingDotsEffect(
                    activeDotColor: AppColors.primary,
                    dotColor: Colors.black26,
                    dotWidth: 8,
                    dotHeight: 8,
                  ),
                ),
                ElevatedButton(
                  onPressed: nextPageChange,
                  style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.all(14),
                  ),
                  child: const Icon(Icons.arrow_forward, color: Colors.white),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget page(BuildContext context, int index) {
    final transl = Translations.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 600,
          alignment: Alignment.center,
          color: AppColors.primary,
          child: onboardImages[index].image(
            fit: BoxFit.contain,
            height: 300,
          ),
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            transl.onboarding.title[index],
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const SizedBox(height: 6),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            transl.onboarding.description[index],
          ),
        )
      ],
    );
  }
}
