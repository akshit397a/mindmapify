import 'package:mindmapify/common/widgets/appbar/appbar.dart';
import 'package:mindmapify/common/widgets/brands/brand_card.dart';
import 'package:mindmapify/common/widgets/products/sortable/sortable_products.dart';
import 'package:mindmapify/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class BrandProducts extends StatelessWidget {
  const BrandProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: MyAppBar(
        title: Text('Asus'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(AppSizes.defaultSpace),
          child: Column(
            children: [
              // Brand Detail
              AppBrandCard(showBorder: true),
              SizedBox(height: AppSizes.spaceBtwSections),

              AppSortableProducts(),
            ],
          ),
        ),
      ),
    );
  }
}
