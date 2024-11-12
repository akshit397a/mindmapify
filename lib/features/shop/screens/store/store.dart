// import 'package:fix_it_solutions/common/widgets/appbar/appbar.dart';
// import 'package:fix_it_solutions/common/widgets/brands/brand_card.dart';
// import 'package:fix_it_solutions/common/widgets/brands/brand_card1.dart';
// import 'package:fix_it_solutions/common/widgets/brands/brand_card2.dart';
// import 'package:fix_it_solutions/common/widgets/brands/brand_card3.dart';
// import 'package:fix_it_solutions/common/widgets/custom_shapes/containers/search_container.dart';
// import 'package:fix_it_solutions/common/widgets/layouts/grid_layout.dart';
// import 'package:fix_it_solutions/common/widgets/texts/section_heading.dart';
// import 'package:fix_it_solutions/features/shop/screens/brand/all_brands.dart';
// import 'package:fix_it_solutions/features/shop/screens/store/widgets/category_tab.dart';
// import 'package:fix_it_solutions/utils/constants/colors.dart';
// import 'package:fix_it_solutions/utils/constants/sizes.dart';
// import 'package:fix_it_solutions/utils/helpers/helper_functions.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class StoreScreen extends StatelessWidget {
//   const StoreScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 5,
//       child: Scaffold(
//         appBar: MyAppBar(
//           title:
//               Text('Search', style: Theme.of(context).textTheme.headlineMedium),
//         ),
//         body: NestedScrollView(
//           headerSliverBuilder: (_, innerBoxIsScrolled) {
//             return [
//               SliverAppBar(
//                 automaticallyImplyLeading: false,
//                 pinned: true,
//                 floating: true,
//                 backgroundColor: AppHelperFunctions.isDarkMode(context)
//                     ? AppColors.black
//                     : AppColors.white,
//                 expandedHeight: 440,
//                 flexibleSpace: Padding(
//                   padding: const EdgeInsets.all(AppSizes.defaultSpace),
//                   child: ListView(
//                     shrinkWrap: true,
//                     physics: const NeverScrollableScrollPhysics(),
//                     children: [
//                       // -- Search Bar
//                       const SizedBox(height: AppSizes.spaceBtwItems),
//                       const AppSearchContainer(
//                         text: 'Search the book',
//                         showBorder: true,
//                         showBackground: false,
//                         padding: EdgeInsets.zero,
//                       ),
//                       const SizedBox(height: AppSizes.spaceBtwSections),

//                       // -- Featured Brands
//                       AppSectionHeading(
//                         title: 'Popular Books',
//                         onPressed: () => Get.to(() => const AllBrandsScreen()),
//                       ),
//                       const SizedBox(height: AppSizes.spaceBtwItems / 1.5),

//                       // -- Brand GRID

                      // AppGridLayout(
                      //   itemCount: 1,
                      //   mainAxisExtent: 80,
                      //   itemBuilder: (_, index) {
                      //     return const AppBrandCard(showBorder: false);
                      //   },
                      // ),
//                       AppGridLayout(
//                         itemCount: 1,
//                         mainAxisExtent: 80,
//                         itemBuilder: (_, index) {
//                           return const AppBrandCard1(showBorder: false);
//                         },
//                       ),
//                       AppGridLayout(
//                         itemCount: 1,
//                         mainAxisExtent: 80,
//                         itemBuilder: (_, index) {
//                           return const AppBrandCard2(showBorder: false);
//                         },
//                       ),
//                       AppGridLayout(
//                         itemCount: 1,
//                         mainAxisExtent: 80,
//                         itemBuilder: (_, index) {
//                           return const AppBrandCard3(showBorder: false);
//                         },
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ];
//           },
//           body: const Center(
//             child:
//                 Icon(Icons.star, size: 50), // Example icon, you can change it
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:fix_it_solutions/common/widgets/appbar/appbar.dart';
import 'package:fix_it_solutions/common/widgets/brands/brand_card.dart';
import 'package:fix_it_solutions/common/widgets/brands/brand_card1.dart';
import 'package:fix_it_solutions/common/widgets/brands/brand_card2.dart';
import 'package:fix_it_solutions/common/widgets/brands/brand_card3.dart';
import 'package:fix_it_solutions/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:fix_it_solutions/common/widgets/layouts/grid_layout.dart';
import 'package:fix_it_solutions/common/widgets/texts/section_heading.dart';
import 'package:fix_it_solutions/features/shop/screens/brand/all_brands.dart';
import 'package:fix_it_solutions/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: Text(
          'Search',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // -- Search Bar
          const Padding(
            padding: EdgeInsets.all(AppSizes.defaultSpace),
            child: AppSearchContainer(
              text: 'Search the book',
              showBorder: true,
              showBackground: false,
              padding: EdgeInsets.zero,
            ),
          ),

          // -- Popular Books Section
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSizes.defaultSpace),
            child: AppSectionHeading(
              title: 'Popular Books',
              onPressed: () => Get.to(() => const AllBrandsScreen()),
            ),
          ),
          const SizedBox(height: AppSizes.spaceBtwItems / 1.5),

          AppGridLayout(
                        itemCount: 1,
                        mainAxisExtent: 80,
                        itemBuilder: (_, index) {
                          return const AppBrandCard(showBorder: false);
                        },
                      ),
                
          AppGridLayout(
                        itemCount: 1,
                        mainAxisExtent: 80,
                        itemBuilder: (_, index) {
                          return const AppBrandCard1(showBorder: false);
                        },
                      ),

          AppGridLayout(
                        itemCount: 1,
                        mainAxisExtent: 80,
                        itemBuilder: (_, index) {
                          return const AppBrandCard2(showBorder: false);
                        },
                      ),

          AppGridLayout(
                        itemCount: 1,
                        mainAxisExtent: 80,
                        itemBuilder: (_, index) {
                          return const AppBrandCard3(showBorder: false);
                        },
                      ),                  
          
          // -- Empty Body (Icon in Center)
          const Expanded(
            child: Center(
              child: Icon(Icons.star, size: 0), // Example icon, replace as needed
            ),
          ),
        ],
      ),
    );
  }
}
