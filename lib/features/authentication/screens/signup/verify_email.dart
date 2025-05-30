import 'package:fix_it_solutions/common/widgets/success_screen/success_screen.dart';
import 'package:fix_it_solutions/features/authentication/screens/login/login.dart';
import 'package:fix_it_solutions/utils/constants/image_strings.dart';
import 'package:fix_it_solutions/utils/constants/sizes.dart';
import 'package:fix_it_solutions/utils/constants/text_strings.dart';
import 'package:fix_it_solutions/utils/helpers/helper_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () => Get.offAll(() => const LoginScreen()),
              icon: const Icon(CupertinoIcons.clear))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.defaultSpace),
          child: SizedBox(
            child: Column(
              children: [
                // Image
                Image(
                  image: const AssetImage(AppImages.deliveredEmailIllustration),
                  width: AppHelperFunctions.screenWidth() * 0.6,
                ),
                const SizedBox(height: AppSizes.spaceBtwSections),
            
                // Title and SubTitle
                Text(
                  AppTexts.confirmEmail,
                  style: Theme.of(context).textTheme.headlineMedium,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: AppSizes.spaceBtwItems),
                Text(
                  'a.04agarwal@gmail.com',
                  style: Theme.of(context).textTheme.labelLarge,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: AppSizes.spaceBtwItems),
                Text(
                  AppTexts.confirmEmailSubTitle,
                  style: Theme.of(context).textTheme.labelMedium,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: AppSizes.spaceBtwSections),

                // Buttons
                SizedBox(
                  width: double.infinity, 
                  child: ElevatedButton(
                    onPressed: () => Get.to(() => SuccessScreen(
                      image: AppImages.staticSuccessIllustration,
                      title: AppTexts.yourAccountCreatedTitle,
                      subTitle: AppTexts.yourAccountCreatedSubTitle,
                      onPressed: () => Get.to(() => const LoginScreen()),
                      ),
                      ),

                  child: const Text(AppTexts.appContinue),
                ),),
                const SizedBox(height: AppSizes.spaceBtwItems),
                SizedBox(
                  width: double.infinity, 
                  child: TextButton(onPressed: () {},
                  child: const Text(AppTexts.resendEmail),
                ),),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
