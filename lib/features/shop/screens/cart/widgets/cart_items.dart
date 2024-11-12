import 'package:fix_it_solutions/common/widgets/products/cart/add_remove_button.dart';
import 'package:fix_it_solutions/common/widgets/products/cart/cart_item.dart';
import 'package:fix_it_solutions/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

import '../../../../../common/widgets/texts/product_price_text.dart';

class AppCartItems extends StatelessWidget {
  const AppCartItems({
    super.key, 
    this.showAddRemoveButtons = true,
    });

  final bool showAddRemoveButtons;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemCount: 2,
      separatorBuilder: (_, __) =>
          const SizedBox(height: AppSizes.spaceBtwSections),
      itemBuilder: (_, index) => Column(
        children: [
          // Cart Item
          const AppCartItem(),
          if(showAddRemoveButtons)
          const SizedBox(height: AppSizes.spaceBtwItems),

          //  Add Remove Button Row with total Price
          if(showAddRemoveButtons)
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  // Extra Space
                  SizedBox(width: 70),

                  // Add Remove Buttons
                  AppProductQuantityWithAddRemoveButton(),
                ],
              ),

              // -- Product total price
              AppProductPriceText(
                price: '256',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
