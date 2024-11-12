import 'package:fix_it_solutions/common/widgets/appbar/appbar.dart';
import 'package:fix_it_solutions/common/widgets/images/rounded_image.dart';
import 'package:fix_it_solutions/common/widgets/products/product_cards/product_card_horizontal.dart';
import 'package:fix_it_solutions/common/widgets/texts/section_heading.dart';
import 'package:fix_it_solutions/utils/constants/image_strings.dart';
import 'package:fix_it_solutions/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class SubCategoriesScreen extends StatelessWidget {
  const SubCategoriesScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(
        title: Text('Sports shirts'),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.defaultSpace),
          child: Column(
            children: [
              // Banner
              const AppRoundedImage(
                  width: double.infinity,
                  imageUrl: AppImages.promoBanner4,
                  applyImageRadius: true),
              const SizedBox(height: AppSizes.spaceBtwSections),

              // Sub-Categories
              Column(
                children: [
                  // Heading
                  AppSectionHeading(title: 'Sports Shirts', onPressed: () {}),
                  const SizedBox(height: AppSizes.spaceBtwItems / 2),

                  SizedBox(
                    height: 120,
                    child: ListView.separated(
                      itemCount: 4,
                      scrollDirection: Axis.horizontal,
                      separatorBuilder: (context, index) => const SizedBox(width: AppSizes.spaceBtwItems),
                      itemBuilder: (context, index) => const AppProductCardHorizontal(),
                    ),
                  ),

                  AppSectionHeading(title: 'Sports Equipments', onPressed: () {}),
                  const SizedBox(height: AppSizes.spaceBtwItems / 2),

                  SizedBox(
                    height: 120,
                    child: ListView.separated(
                      itemCount: 4,
                      scrollDirection: Axis.horizontal,
                      separatorBuilder: (context, index) => const SizedBox(width: AppSizes.spaceBtwItems),
                      itemBuilder: (context, index) => const AppProductCardHorizontal(),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
