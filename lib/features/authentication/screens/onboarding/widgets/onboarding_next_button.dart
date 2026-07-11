import 'package:mindmapify/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:mindmapify/utils/constants/colors.dart';
import 'package:mindmapify/utils/constants/sizes.dart';
import 'package:mindmapify/utils/device/device_utility.dart';
import 'package:mindmapify/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class OnBoardingNextButton extends StatelessWidget {
  const OnBoardingNextButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = AppHelperFunctions.isDarkMode(context);

    return Positioned(
      right: AppSizes.defaultSpace,
      bottom: AppDeviceUtils.getBottomNavigationBarHeight(),
      child: ElevatedButton(
        onPressed: () => OnBoardingController.instance.nextPage(),
        style: ElevatedButton.styleFrom(
            shape: const CircleBorder(),
            backgroundColor: dark ? AppColors.primary : Colors.black),
        child: const Icon(Iconsax.arrow_right_3),
      ),
    );
  }
}
