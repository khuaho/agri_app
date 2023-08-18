import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../global/themes/app_colors.dart';
import '../../../global/widgets/avatar.dart';
import '../../../global/widgets/shimmer/shimmer_image.dart';

class CropDetailCarousel extends StatefulWidget {
  const CropDetailCarousel({
    super.key,
    required this.images,
  });

  final List<String> images;

  @override
  State<CropDetailCarousel> createState() => _CropDetailCarouselState();
}

class _CropDetailCarouselState extends State<CropDetailCarousel> {
  CarouselController carouselController = CarouselController();
  int currentPage = 0;

  void changePageIndex(int index) {
    carouselController.animateToPage(
      index,
      duration: const Duration(
        milliseconds: 300,
      ),
      curve: Curves.linear,
    );
    setState(() {
      currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          CarouselSlider(
            options: CarouselOptions(
              autoPlay: true,
              viewportFraction: 1,
              aspectRatio: 2.0,
              enlargeCenterPage: true,
              onPageChanged: (index, reason) {
                setState(() {
                  currentPage = index;
                });
              },
            ),
            carouselController: carouselController,
            items: widget.images.map((i) {
              return ShimmerImage(imageUrl: i);
            }).toList(),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: widget.images
                .asMap()
                .map(
                  (i, e) => MapEntry(
                    i,
                    GestureDetector(
                      onTap: () => changePageIndex(i),
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: currentPage == i
                                ? AppColors.alertDefault
                                : AppColors.white,
                            width: 2,
                          ),
                          shape: BoxShape.circle,
                        ),
                        child: Avatar(
                          imageUrl: e,
                        ),
                      ),
                    ),
                  ),
                )
                .values
                .toList(),
          )
        ],
      ),
    );
  }
}
