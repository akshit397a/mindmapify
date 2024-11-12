import 'package:carousel_slider/carousel_slider.dart';
import 'package:fix_it_solutions/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:fix_it_solutions/common/widgets/images/rounded_image.dart';
import 'package:fix_it_solutions/features/shop/controllers/home_controller.dart';
import 'package:fix_it_solutions/utils/constants/colors.dart';
import 'package:fix_it_solutions/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppPromoSlider extends StatelessWidget {
  const AppPromoSlider({
    super.key,
    required this.banners,
  });

  final List<String> banners;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
              viewportFraction: 1,
              autoPlay: true, // Enable auto-play
              autoPlayInterval: const Duration(seconds: 3), // Adjust the duration between slides
              autoPlayAnimationDuration: const Duration(milliseconds: 1000), // Control the animation duration
              autoPlayCurve: Curves.fastOutSlowIn, // Apply a smooth curve for animation
              enlargeCenterPage: true, // Enlarge the center image
              onPageChanged: (index, _) =>
                  controller.updatePageIndicator(index)),
          items: banners.map((url) => AppRoundedImage(imageUrl: url)).toList(),
        ),
        const SizedBox(height: AppSizes.spaceBtwItems),
        Center(
          child: Obx(
            () => Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                for (int i = 0; i < banners.length; i++)
                  AppCircularContainer(
                      width: 23,
                      height: 4,
                      margin: const EdgeInsets.only(right: 4),
                      backgroundColor: controller.carouselCurrentIndex.value == i
                          ? AppColors.primary
                          : AppColors.grey,
                    ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
