import 'package:fix_it_solutions/common/widgets/layouts/grid_layout.dart';
import 'package:fix_it_solutions/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:fix_it_solutions/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class AppSortableProducts extends StatelessWidget {
  const AppSortableProducts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Dropdown
        DropdownButtonFormField(
          decoration:
              const InputDecoration(prefixIcon: Icon(Iconsax.sort)),
          onChanged: (value) {},
          items: [
            'Name',
            'Higher Price',
            'Lower Price',
            'Sale',
            'Newest',
            'Popularity'
          ]
              .map((option) =>
                  DropdownMenuItem(value: option, child: Text(option)))
              .toList(),
        ),
        const SizedBox(height: AppSizes.spaceBtwSections),
    
        // Products
        AppGridLayout(
          itemCount: 8,
          itemBuilder: (_, index) => const AppProductCardVertical(),
        ),
      ],
    );
  }
}