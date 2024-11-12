import 'package:fix_it_solutions/common/widgets/appbar/appbar.dart';
import 'package:fix_it_solutions/common/widgets/brands/brand_card.dart';
import 'package:fix_it_solutions/common/widgets/brands/brand_card1.dart';
import 'package:fix_it_solutions/common/widgets/brands/brand_card4.dart';
import 'package:fix_it_solutions/common/widgets/brands/brand_card5.dart';
import 'package:fix_it_solutions/common/widgets/brands/brand_card6.dart';
import 'package:fix_it_solutions/common/widgets/brands/brand_card7.dart';
import 'package:fix_it_solutions/common/widgets/brands/brand_card8.dart';
import 'package:fix_it_solutions/common/widgets/brands/brand_card9.dart';
import 'package:fix_it_solutions/common/widgets/layouts/grid_layout.dart';
import 'package:fix_it_solutions/common/widgets/texts/section_heading.dart';
import 'package:fix_it_solutions/features/shop/screens/brand/brand_products.dart';
import 'package:fix_it_solutions/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllBrandsScreen extends StatelessWidget {
  const AllBrandsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(
        title: Text('Books'),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.defaultSpace),
          child: Column(
            children: [
              // Heading
              const AppSectionHeading(title: 'Books', showActionButton: false),
              const SizedBox(height: AppSizes.spaceBtwItems),

              // -- Brands
              AppGridLayout(
                  itemCount: 1,
                  mainAxisExtent: 80,
                  itemBuilder: (context, index) =>
                      AppBrandCard(
                        showBorder: true,
                        onTap: () => Get.to(() => const BrandProducts()),
                        )),

            AppGridLayout(
                  itemCount: 1,
                  mainAxisExtent: 80,
                  itemBuilder: (context, index) =>
                      AppBrandCard1(
                        showBorder: true,
                        onTap: () => Get.to(() => const BrandProducts()),
                        )),

            AppGridLayout(
                  itemCount: 1,
                  mainAxisExtent: 80,
                  itemBuilder: (context, index) =>
                      AppBrandCard4(
                        showBorder: true,
                        onTap: () => Get.to(() => const BrandProducts()),
                        )),

            AppGridLayout(
                  itemCount: 1,
                  mainAxisExtent: 80,
                  itemBuilder: (context, index) =>
                      AppBrandCard5(
                        showBorder: true,
                        onTap: () => Get.to(() => const BrandProducts()),
                        )),

            AppGridLayout(
                  itemCount: 1,
                  mainAxisExtent: 80,
                  itemBuilder: (context, index) =>
                      AppBrandCard6(
                        showBorder: true,
                        onTap: () => Get.to(() => const BrandProducts()),
                        )),

            AppGridLayout(
                  itemCount: 1,
                  mainAxisExtent: 80,
                  itemBuilder: (context, index) =>
                      AppBrandCard7(
                        showBorder: true,
                        onTap: () => Get.to(() => const BrandProducts()),
                        )),

            AppGridLayout(
                  itemCount: 1,
                  mainAxisExtent: 80,
                  itemBuilder: (context, index) =>
                      AppBrandCard8(
                        showBorder: true,
                        onTap: () => Get.to(() => const BrandProducts()),
                        )),

            AppGridLayout(
                  itemCount: 1,
                  mainAxisExtent: 80,
                  itemBuilder: (context, index) =>
                      AppBrandCard9(
                        showBorder: true,
                        onTap: () => Get.to(() => const BrandProducts()),
                        )),
            ],
          ),
        ),
      ),
    );
  }
}
