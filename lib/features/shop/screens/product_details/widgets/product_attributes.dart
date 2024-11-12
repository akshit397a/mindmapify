import 'package:fix_it_solutions/common/widgets/chips/choice_chip.dart';
import 'package:fix_it_solutions/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:fix_it_solutions/common/widgets/texts/product_price_text.dart';
import 'package:fix_it_solutions/common/widgets/texts/product_tile_text.dart';
import 'package:fix_it_solutions/common/widgets/texts/section_heading.dart';
import 'package:fix_it_solutions/utils/constants/colors.dart';
import 'package:fix_it_solutions/utils/constants/sizes.dart';
import 'package:fix_it_solutions/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class AppProductAttributes extends StatelessWidget {
  const AppProductAttributes({super.key});
  @override
  Widget build(BuildContext context) {
    final dark = AppHelperFunctions.isDarkMode(context);
    return Column(
      children: [
        // -- Selected Attribute Pricing & Description
        AppRoundedContainer(
          padding: const EdgeInsets.all(AppSizes.md),
          backgroundColor: dark ? AppColors.darkerGrey : AppColors.grey,
          child: Column(
            children: [
              // Title, Price and Stock Status
              Row(
                children: [
                  const AppSectionHeading(
                      title: 'Variation', showActionButton: false),
                  const SizedBox(width: AppSizes.spaceBtwItems),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const AppProductTitleText(
                              title: 'Price : ', smallSize: true),
                          const SizedBox(width: AppSizes.spaceBtwItems),
                          // Actual Price
                          Text(
                            '\$25',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .apply(decoration: TextDecoration.lineThrough),
                          ),
                          const SizedBox(width: AppSizes.spaceBtwItems),

                          // Sale Price
                          const AppProductPriceText(
                            price: '20',
                          ),
                        ],
                      ),

                      // Stock
                      Row(
                        children: [
                          const AppProductTitleText(
                              title: 'Stock : ', smallSize: true),
                          const SizedBox(width: AppSizes.spaceBtwInputFields),
                          Text('In Stock',
                              style: Theme.of(context).textTheme.titleMedium),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              // Variation Description
              const AppProductTitleText(
                title:
                    'This is the description of the Product and it can go up to max 4 lines',
                smallSize: true,
                maxLines: 4,
              ),
            ],
          ),
        ),
        const SizedBox(height: AppSizes.spaceBtwItems),

        // -- Attributes
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AppSectionHeading(title: 'Colors', showActionButton: false),
            const SizedBox(height: AppSizes.spaceBtwItems / 2),
            Wrap(
              spacing: 8,
              children: [
                AppChoiceChip(
                    text: 'Black', selected: true, onSelected: (value) {}),
                AppChoiceChip(
                    text: 'Green', selected: false, onSelected: (value) {}),
                AppChoiceChip(
                    text: 'Blue', selected: false, onSelected: (value) {}),
                AppChoiceChip(
                    text: 'Yellow', selected: false, onSelected: (value) {}),
                AppChoiceChip(
                    text: 'Red', selected: false, onSelected: (value) {}),           
              ],
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AppSectionHeading(title: 'Size'),
            const SizedBox(height: AppSizes.spaceBtwItems / 2),
            Wrap(
              spacing: 8,
              children: [
                AppChoiceChip(
                text: 'EU 28', selected: true, onSelected: (value) {}),
                AppChoiceChip(
                text: 'EU 32', selected: false, onSelected: (value) {}),
                AppChoiceChip(
                text: 'EU 36', selected: false, onSelected: (value) {}),
                AppChoiceChip(
                text: 'EU 40', selected: false, onSelected: (value) {}),
                AppChoiceChip(
                text: 'EU 42', selected: false, onSelected: (value) {}),
              ],
            )
          ],
        ),
      ],
    );
  }
}
