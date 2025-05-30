import 'package:fix_it_solutions/utils/constants/colors.dart';
import 'package:fix_it_solutions/utils/constants/sizes.dart';
import 'package:fix_it_solutions/utils/device/device_utility.dart';
import 'package:fix_it_solutions/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class AppSearchContainer extends StatelessWidget {
  const AppSearchContainer({
    super.key,
    required this.text,
    this.icon = Iconsax.search_normal,
    this.showBackground = true,
    this.showBorder = true,
    this.onTap,
    this.padding =
        const EdgeInsets.symmetric(horizontal: AppSizes.defaultSpace),
  });

  final String text;
  final IconData? icon;
  final bool showBackground, showBorder;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    final dark = AppHelperFunctions.isDarkMode(context);

    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: padding,
        child: Container(
            width: AppDeviceUtils.getScreenWidth(context),
            padding: const EdgeInsets.all(AppSizes.md),
            decoration: BoxDecoration(
                color: showBackground
                    ? dark
                        ? AppColors.dark
                        : AppColors.light
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(AppSizes.cardRadiusLg),
                border: showBorder ? Border.all(color: AppColors.grey) : null),
            child: Row(
              children: [
                Icon(icon, color: dark ? AppColors.darkerGrey : Colors.grey),
                const SizedBox(width: AppSizes.spaceBtwItems),
                Text(text, style: Theme.of(context).textTheme.bodySmall),
              ],
            )),
      ),
    );
  }
}
