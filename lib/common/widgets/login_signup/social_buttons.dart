import 'package:fix_it_solutions/utils/constants/colors.dart';
import 'package:fix_it_solutions/utils/constants/image_strings.dart';
import 'package:fix_it_solutions/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class AppSocialButtons extends StatelessWidget {
  const AppSocialButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(color: AppColors.grey),
                borderRadius: BorderRadius.circular(100)),
            child: IconButton(
              onPressed: () {},
              icon: const Image(
                width: AppSizes.iconMd,
                height: AppSizes.iconMd,
                image: AssetImage(AppImages.google),
              ),
            ),
          ),
        ),
        const SizedBox(width: AppSizes.spaceBtwItems),
        Flexible(
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(color: AppColors.grey),
                borderRadius: BorderRadius.circular(100)),
            child: IconButton(
              onPressed: () {},
              icon: const Image(
                width: AppSizes.iconMd,
                height: AppSizes.iconMd,
                image: AssetImage(AppImages.facebook),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
