import 'package:fix_it_solutions/features/authentication/controllers/signup/signup_controller.dart';
import 'package:fix_it_solutions/utils/constants/colors.dart';
import 'package:fix_it_solutions/utils/constants/sizes.dart';
import 'package:fix_it_solutions/utils/constants/text_strings.dart';
import 'package:fix_it_solutions/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppTermsAndConditionCheckbox extends StatelessWidget {
  const AppTermsAndConditionCheckbox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = SignupController.instance;
  final dark = AppHelperFunctions.isDarkMode(context);  
    return Row(
      children: [
        SizedBox(
            width: 24,
            height: 24,
            child: Obx(() => Checkbox(
              value: controller.privacyPolicy.value, 
              onChanged: (value) => controller.privacyPolicy.value = !controller.privacyPolicy.value),
              ),
              ),
        const SizedBox(width: AppSizes.spaceBtwItems - 3),
        Text.rich(TextSpan(children: [
          TextSpan(
              text: '${AppTexts.iAgreeTo} ',
              style: Theme.of(context).textTheme.bodySmall),
          TextSpan(
              text: '${AppTexts.privacyPolicy} ',
              style: Theme.of(context).textTheme.bodyMedium!.apply(
                    color: dark ? AppColors.white : AppColors.primary,
                    decoration: TextDecoration.underline,
                    decorationColor:
                        dark ? AppColors.white : AppColors.primary,
                  )),
          TextSpan(
              text: '${AppTexts.and} ',
              style: Theme.of(context).textTheme.bodySmall),
          TextSpan(
              text: AppTexts.termsOfUse,
              style: Theme.of(context).textTheme.bodyMedium!.apply(
                    color: dark ? AppColors.white : AppColors.primary,
                    decoration: TextDecoration.underline,
                    decorationColor:
                        dark ? AppColors.white : AppColors.primary,
                  )),
        ]))
      ],
    );
  }
}
