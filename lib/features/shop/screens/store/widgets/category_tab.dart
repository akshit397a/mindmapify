import 'package:fix_it_solutions/common/widgets/brands/brand_show_case.dart';
import 'package:fix_it_solutions/common/widgets/layouts/grid_layout.dart';
import 'package:fix_it_solutions/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:fix_it_solutions/common/widgets/texts/section_heading.dart';
import 'package:fix_it_solutions/utils/constants/image_strings.dart';
import 'package:fix_it_solutions/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class AppCategoryTab extends StatelessWidget {
  const AppCategoryTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          Padding(
            padding: const EdgeInsets.all(AppSizes.defaultSpace),
            child: Column(
              children: [
                // -- Brands
                const AppBrandShowcase(
                  images: [
                    AppImages.productImage1,
                    AppImages.productImage2,
                    AppImages.productImage3,
                  ],
                ),
                const AppBrandShowcase(
                  images: [
                    AppImages.productImage1,
                    AppImages.productImage2,
                    AppImages.productImage3,
                  ],
                ),
                const SizedBox(height: AppSizes.spaceBtwItems),

                // -- Products
                AppSectionHeading(title: 'You might like', onPressed: () {}),
                const SizedBox(height: AppSizes.spaceBtwItems),

                AppGridLayout(
                    itemCount: 4,
                    itemBuilder: (_, index) => const AppProductCardVertical()),
                const SizedBox(height: AppSizes.spaceBtwSections),
              ],
            ),
          ),
        ]);
  }
}
