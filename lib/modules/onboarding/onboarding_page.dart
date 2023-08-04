import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

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

  //  List<AssetGenImage> onboardImages = [
  //   Assets.images.intro1,
  //   Assets.images.intro2,
  // ];

  void onPageViewChange(int page) {
    // setState(() {
    //   isLastPage = page == onboardImages.length - 1;
    // });
  }
  @override
  Widget build(BuildContext context) {
    // final t = Translations.of(context);
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView(
              physics: const ClampingScrollPhysics(),
              controller: pageController,
              onPageChanged: onPageViewChange,
              children: List.generate(
                3,
                (index) => page(index),
              ),
              // children: List.generate(
              //   onboardImages.length,
              //   (index) => page(i18n, index),
              // ),
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
                  count: 3,
                  // count: onboardImages.length,
                  effect: const ExpandingDotsEffect(
                    activeDotColor: AppColors.primary,
                    dotColor: Colors.black26,
                    dotWidth: 8,
                    dotHeight: 8,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
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

  Widget page(int index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Container(
            color: AppColors.primary,
          ),
        ),
        const SizedBox(height: 20),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            'Shop and Earn points',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const SizedBox(height: 6),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            'Earn points by following a link and purchasing online or by registering your payment card and choosing in store offers',
          ),
        )
      ],
    );
  }
}
