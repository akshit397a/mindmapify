import 'package:fix_it_solutions/common/widgets/texts/section_heading.dart';
import 'package:fix_it_solutions/features/shop/screens/product_details/widgets/bottom_add_to_cart_widget.dart';
import 'package:fix_it_solutions/features/shop/screens/product_details/widgets/product_attributes.dart';
import 'package:fix_it_solutions/features/shop/screens/product_details/widgets/product_detail_image_slider.dart';
import 'package:fix_it_solutions/features/shop/screens/product_details/widgets/product_meta_data.dart';
import 'package:fix_it_solutions/features/shop/screens/product_details/widgets/rating_share_widget.dart';
import 'package:fix_it_solutions/features/shop/screens/product_reviews/product_reviews.dart';
import 'package:fix_it_solutions/utils/constants/sizes.dart';
//import 'package:e_commerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //final dark = AppHelperFunctions.isDarkMode(context);
    return Scaffold(
      bottomNavigationBar: const AppBottomAddToCart(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // -- Product Image Slider
            const AppProductImageSlider(),

            // -- Product Details
            Padding(
              padding: const EdgeInsets.only(
                right: AppSizes.defaultSpace,
                left: AppSizes.defaultSpace,
                bottom: AppSizes.defaultSpace,
              ),
              child: Column(
                children: [
                  // -- Rating & Share Button
                  const AppRatingAndShare(),

                  // -- Price, Title, Stack, & Brand
                  const AppProductMetaData(),

                  // -- Attributes
                  const AppProductAttributes(),
                  const SizedBox(height: AppSizes.spaceBtwSections),

                  // -- Checkout Button
                  SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () {}, child: const Text('Checkout'))),
                  const SizedBox(height: AppSizes.spaceBtwItems),

                  // -- Description
                  const AppSectionHeading(
                      title: 'Description', showActionButton: false),
                  const SizedBox(height: AppSizes.spaceBtwItems),
                  const ReadMoreText(
                    'This is a Product description for Blue Nike Sleeve less vest. There are more things that can be added but i am just practicing and nothing else.',
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: ' Show more',
                    trimExpandedText: ' Less',
                    moreStyle:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                    lessStyle:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                  ),

                  // -- Reviews
                  const Divider(),
                  const SizedBox(height: AppSizes.spaceBtwItems),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const AppSectionHeading(
                          title: 'Reviews(199)', showActionButton: false),
                      IconButton(
                          icon: const Icon(Iconsax.arrow_right_3, size: 18),
                          onPressed: () => Get.to(() => const ProductReviewsScreen())),
                    ],
                  ),
                  const SizedBox(height: AppSizes.spaceBtwSections),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
