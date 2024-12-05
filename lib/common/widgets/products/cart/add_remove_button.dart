import 'package:fix_it_solutions/common/widgets/icons/circular_icon.dart';
import 'package:fix_it_solutions/utils/constants/colors.dart';
import 'package:fix_it_solutions/utils/constants/sizes.dart';
import 'package:fix_it_solutions/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class AppProductQuantityWithAddRemoveButton extends StatelessWidget {
  const AppProductQuantityWithAddRemoveButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        AppCircularIcon(
          icon: Iconsax.minus,
          width: 32,
          height: 32,
          size: AppSizes.md,
          color: AppHelperFunctions.isDarkMode(context) ? AppColors.white : AppColors.black,
          backgroundColor: AppHelperFunctions.isDarkMode(context) ? AppColors.darkerGrey : AppColors.light,
          ),
          const SizedBox(width: AppSizes.spaceBtwItems),
          Text('2', style: Theme.of(context).textTheme.titleSmall),
          const SizedBox(width: AppSizes.spaceBtwItems),
    
          const AppCircularIcon(
          icon: Iconsax.add,
          width: 32,
          height: 32,
          size: AppSizes.md,
          color: AppColors.white,
          backgroundColor: AppColors.primary,
          ),
      ],
    );
  }
}
