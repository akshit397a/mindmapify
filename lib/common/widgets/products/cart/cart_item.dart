import 'package:mindmapify/common/widgets/images/rounded_image.dart';
import 'package:mindmapify/common/widgets/texts/brand_title_text_with_verified_icon.dart';
import 'package:mindmapify/common/widgets/texts/product_tile_text.dart';
import 'package:mindmapify/utils/constants/colors.dart';
import 'package:mindmapify/utils/constants/image_strings.dart';
import 'package:mindmapify/utils/constants/sizes.dart';
import 'package:mindmapify/utils/helpers/helper_functions.dart';

import 'package:flutter/material.dart';

class AppCartItem extends StatelessWidget {
  const AppCartItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Image
        AppRoundedImage(
          imageUrl: AppImages.productImage1,
          width: 60,
          height: 60,
          padding: const EdgeInsets.all(AppSizes.sm),
          backgroundColor: AppHelperFunctions.isDarkMode(context)
              ? AppColors.darkerGrey
              : AppColors.light,
        ),
        const SizedBox(width: AppSizes.spaceBtwItems),

        // Title, Price & Size
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AppBrandTitleWithVerifiedIcon(title: 'Asus'),
              const Flexible(
                child: AppProductTitleText(
                    title: 'Black Sports Shoes', maxLines: 1),
              ),

              // Attributes
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                        text: 'Color',
                        style: Theme.of(context).textTheme.bodySmall),
                    TextSpan(
                        text: 'Green',
                        style: Theme.of(context).textTheme.bodyLarge),
                    TextSpan(
                        text: 'Size',
                        style: Theme.of(context).textTheme.bodySmall),
                    TextSpan(
                        text: 'IND 08',
                        style: Theme.of(context).textTheme.bodyLarge),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
