import 'package:fix_it_solutions/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:fix_it_solutions/features/authentication/screens/onboarding/widgets/onboarding_dot_navigation.dart';
import 'package:fix_it_solutions/features/authentication/screens/onboarding/widgets/onboarding_next_button.dart';
import 'package:fix_it_solutions/features/authentication/screens/onboarding/widgets/onboarding_page.dart';
import 'package:fix_it_solutions/features/authentication/screens/onboarding/widgets/onboarding_skip.dart';
import 'package:fix_it_solutions/utils/constants/image_strings.dart';
import 'package:fix_it_solutions/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());

    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: const [
              OnBoardingPage(
                image: AppImages.onBoardingImage1,
                title: AppTexts.onBoardingTitle1,
                subTitle: AppTexts.onBoardingSubTitle1,
              ),
              OnBoardingPage(
                image: AppImages.onBoardingImage3,
                title: AppTexts.onBoardingTitle3,
                subTitle: AppTexts.onBoardingSubTitle3,
              ),
            ],
          ),
          const OnBoardingSkip(),
          const OnBoardingDotNavigation(),
          const OnBoardingNextButton(),
        ],
      ),
    );
  }
}
