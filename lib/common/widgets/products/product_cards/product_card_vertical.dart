import 'package:fix_it_solutions/common/styles/shadows.dart';
import 'package:fix_it_solutions/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:fix_it_solutions/common/widgets/icons/circular_icon.dart';
import 'package:fix_it_solutions/common/widgets/images/rounded_image.dart';
import 'package:fix_it_solutions/common/widgets/texts/brand_title_text_with_verified_icon.dart';
import 'package:fix_it_solutions/common/widgets/texts/product_price_text.dart';
import 'package:fix_it_solutions/common/widgets/texts/product_tile_text.dart';
import 'package:fix_it_solutions/features/shop/screens/product_details/product_details.dart';
import 'package:fix_it_solutions/utils/constants/colors.dart';
import 'package:fix_it_solutions/utils/constants/image_strings.dart';
import 'package:fix_it_solutions/utils/constants/sizes.dart';
import 'package:fix_it_solutions/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class AppProductCardVertical extends StatelessWidget {
  const AppProductCardVertical({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = AppHelperFunctions.isDarkMode(context);

    // Container
    return GestureDetector(
      onTap: () => Get.to(() => const ProductDetailScreen()),
      child: Container(
          width: 180,
          padding: const EdgeInsets.all(1),
          decoration: BoxDecoration(
            boxShadow: [AppShadowStyles.verticalProductShadow],
            borderRadius: BorderRadius.circular(AppSizes.productImageRadius),
            color: dark ? AppColors.darkerGrey : AppColors.white,
          ),
          child: Column(
            children: [
              // Thumbnail
              AppRoundedContainer(
                height: 180,
                padding: const EdgeInsets.all(AppSizes.sm),
                backgroundColor: dark ? AppColors.dark : AppColors.light,
                child: Stack(
                  children: [
                    // -- Thumbnail Image
                    const AppRoundedImage(
                        imageUrl: AppImages.productImage1,
                        applyImageRadius: true),

                    // -- Sale Tag
                    Positioned(
                      top: 12,
                      child: AppRoundedContainer(
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
                    ),

                    // -- Favorite Icon Button
                    const Positioned(
                      top: 0,
                      right: 0,
                      child: AppCircularIcon(
                          icon: Iconsax.heart5, color: Colors.red),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: AppSizes.spaceBtwItems / 2),

              // -- Details
              const Padding(
                padding: EdgeInsets.only(left: AppSizes.sm),
                child: SizedBox(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppProductTitleText(
                          title: 'ASUS Vivobook 15', smallSize: true),
                      SizedBox(height: AppSizes.spaceBtwItems / 2),
                      AppBrandTitleWithVerifiedIcon(title: 'Asus'),
                    ],
                  ),
                ),
              ),

              const Spacer(),

              // Price Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Price
                  const Padding(
                    padding: EdgeInsets.only(left: AppSizes.sm),
                    child: AppProductPriceText(price: '35.0'),
                  ),

                  // Add to cart button
                  Container(
                    decoration: const BoxDecoration(
                      color: AppColors.dark,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(AppSizes.cardRadiusMd),
                        bottomRight:
                            Radius.circular(AppSizes.productImageRadius),
                      ),
                    ),
                    child: const SizedBox(
                        width: AppSizes.iconLg * 1.2,
                        height: AppSizes.iconLg * 1.2,
                        child: Center(
                            child: Icon(Iconsax.add, color: AppColors.white))),
                  ),
                ],
              ),
            ],
          ),
        ),
    );
  }
}
