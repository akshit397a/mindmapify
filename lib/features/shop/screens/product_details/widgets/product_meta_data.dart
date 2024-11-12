import 'package:fix_it_solutions/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:fix_it_solutions/common/widgets/images/circular_image.dart';
import 'package:fix_it_solutions/common/widgets/texts/brand_title_text_with_verified_icon.dart';
import 'package:fix_it_solutions/common/widgets/texts/product_price_text.dart';
import 'package:fix_it_solutions/common/widgets/texts/product_tile_text.dart';
import 'package:fix_it_solutions/utils/constants/colors.dart';
import 'package:fix_it_solutions/utils/constants/enum.dart';
import 'package:fix_it_solutions/utils/constants/image_strings.dart';
import 'package:fix_it_solutions/utils/constants/sizes.dart';
import 'package:fix_it_solutions/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class AppProductMetaData extends StatelessWidget {
  const AppProductMetaData({super.key});
  @override
  Widget build(BuildContext context) {
    final darkMode = AppHelperFunctions.isDarkMode(context);
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      // Price & Sale Price
      Row(
        children: [
          // Sale Tag
          AppRoundedContainer(
            radius: AppSizes.sm,
            backgroundColor: AppColors.secondary.withOpacity(0.8),
            padding: const EdgeInsets.symmetric(
                horizontal: AppSizes.sm, vertical: AppSizes.xs),
            child: Text('25%',
                style: Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .apply(color: AppColors.black)),
          ),
          const SizedBox(width: AppSizes.spaceBtwItems),

          // Price
          Text('\$250',
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .apply(decoration: TextDecoration.lineThrough)),
          const SizedBox(width: AppSizes.spaceBtwItems),
          const AppProductPriceText(price: '175', isLarge: true),
        ],
      ),
      const SizedBox(height: AppSizes.spaceBtwItems / 1.5),

      // Title
      const AppProductTitleText(title: 'Asus Laptop'),
      const SizedBox(height: AppSizes.spaceBtwItems / 1.5),

      // Stock Status
      Row(
        children: [
          const AppProductTitleText(title: 'Status:'),
          const SizedBox(height: AppSizes.spaceBtwItems, width: AppSizes.sm),
          Text('In Stock', style: Theme.of(context).textTheme.titleMedium),
        ],
      ),
      const SizedBox(height: AppSizes.spaceBtwItems / 1.5),

      // Brand
      Row(
        children: [
          AppCircularImage(
            image: AppImages.shoeIcon,
            width: 32,
            height: 32,
            overlayColor: darkMode ? AppColors.white : AppColors.black,
            ),
          const AppBrandTitleWithVerifiedIcon(
              title: 'Asus', brandTextSize: TextSizes.medium),
        ],
      ),
    ]);
  }
}
