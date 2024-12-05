// import 'package:file_picker/file_picker.dart'; 
// import 'package:fix_it_solutions/common/widgets/custom_shapes/containers/primary_header_container.dart';
// import 'package:fix_it_solutions/common/widgets/custom_shapes/containers/search_container.dart';
// import 'package:fix_it_solutions/common/widgets/texts/section_heading.dart';
// import 'package:fix_it_solutions/features/shop/screens/all_products/all_products.dart';
// import 'package:fix_it_solutions/features/shop/screens/home/widgets/home_appbar.dart';
// import 'package:fix_it_solutions/features/shop/screens/home/widgets/promo_slider.dart';
// import 'package:fix_it_solutions/select_pdf_screen.dart';
// import 'package:fix_it_solutions/utils/constants/image_strings.dart';
// import 'package:fix_it_solutions/utils/constants/sizes.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class HomeScreen extends StatelessWidget {
//   const HomeScreen({super.key});

//   // Method to handle file selection
//   Future<void> _pickPdfFile() async {
//     // Pick a PDF file
//     FilePickerResult? result = await FilePicker.platform.pickFiles(
//       type: FileType.custom,
//       allowedExtensions: ['pdf'],
//     );

//     if (result != null) {
//       // If a file is selected, you can do something with the file
//       String filePath = result.files.single.path ?? "";
//       print("Selected PDF: $filePath");

//       // You can also navigate to another screen or open the file here
//       // For example, you could open the PDF or navigate to another page
//     } else {
//       // If no file is selected, show a message or handle it
//       print("No file selected");
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             // Header
//             const AppPrimaryHeaderContainer(
//               child: Column(
//                 children: [
//                   // -- Appbar
//                   MyHomeAppBar(),
//                   SizedBox(height: AppSizes.spaceBtwSections),

//                   // -- SearchBar
//                   AppSearchContainer(text: 'Search PDF'),
//                   SizedBox(height: AppSizes.spaceBtwSections),
                
//                   SizedBox(height: AppSizes.spaceBtwSections),
//                 ],
//               ),
//             ),

//             // --body
//             Padding(
//               padding: const EdgeInsets.symmetric(
//                   horizontal: AppSizes.fontSizeLg,
//                   vertical: AppSizes.dividerHeight),
//               child: Column(
//                 children: [
//                   // -- Promo Slider
//                   const AppPromoSlider(
//                     banners: [
//                       AppImages.promoBanner,
//                       AppImages.promoBanner1,
//                       AppImages.promoBanner2,
//                       AppImages.promoBanner4,
//                       AppImages.promoBanner5,
//                     ],
//                   ),
//                   const SizedBox(height: AppSizes.spaceBtwSections),

//                   // -- Heading
//                   AppSectionHeading(
//                     title: 'Upload PDF',
//                     buttonTitle: '',
//                     onPressed: () => Get.to(() => const AllProducts()),
//                   ),
//                   const SizedBox(height: AppSizes.spaceBtwItems),

//                   // -- Browse Button to pick PDF file
//                   Padding(
//                     padding: const EdgeInsets.symmetric(vertical: AppSizes.spaceBtwItems),
//                     child: ElevatedButton(
//                       onPressed: () => Get.to(() => const SelectPdfScreen()),
//                       style: ElevatedButton.styleFrom(
//                         minimumSize: const Size(double.infinity, 50), // Make button full width
//                       ), // Handle file picking
//                       child: const Text("Upload PDF"),
//                     ),
//                   ),

//                    const Padding(
//                     padding: EdgeInsets.symmetric(vertical: AppSizes.spaceBtwItems),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:file_picker/file_picker.dart'; 
import 'package:fix_it_solutions/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:fix_it_solutions/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:fix_it_solutions/common/widgets/texts/section_heading.dart';
import 'package:fix_it_solutions/features/shop/screens/all_products/all_products.dart';
import 'package:fix_it_solutions/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:fix_it_solutions/features/shop/screens/home/widgets/promo_slider.dart';
import 'package:fix_it_solutions/select_pdf_screen.dart';
import 'package:fix_it_solutions/utils/constants/image_strings.dart';
import 'package:fix_it_solutions/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  // Method to handle file selection
  Future<void> _pickPdfFile() async {
    // Pick a PDF file
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null) {
      // If a file is selected, you can do something with the file
      String filePath = result.files.single.path ?? "";
      print("Selected PDF: $filePath");

      // You can also navigate to another screen or open the file here
      // For example, you could open the PDF or navigate to another page
    } else {
      // If no file is selected, show a message or handle it
      print("No file selected");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header
            const AppPrimaryHeaderContainer(
              child: Column(
                children: [
                  // -- Appbar
                  MyHomeAppBar(),
                  SizedBox(height: AppSizes.spaceBtwSections),  // Space after AppBar

                  // -- SearchBar
                  AppSearchContainer(text: 'Search PDF'),
                  SizedBox(height: AppSizes.spaceBtwSections),  // Space after SearchBar
                
                  SizedBox(height: AppSizes.spaceBtwSections),  // Extra space
                ],
              ),
            ),

            // -- Body Content
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: AppSizes.fontSizeLg,
                  vertical: AppSizes.dividerHeight),
              child: Column(
                children: [
                  // -- Promo Slider
                  const AppPromoSlider(
                    banners: [
                      AppImages.promoBanner,
                      AppImages.promoBanner1,
                      AppImages.promoBanner2,
                      AppImages.promoBanner4,
                      AppImages.promoBanner5,
                    ],
                  ),
                  const SizedBox(height: AppSizes.spaceBtwSections), // Space after promo slider

                  // -- Heading Section
                  AppSectionHeading(
                    title: 'Upload PDF',
                    buttonTitle: '',
                    onPressed: () => Get.to(() => const AllProducts()),
                  ),
                  const SizedBox(height: AppSizes.spaceBtwItems),  // Space after heading

                  // -- Browse Button to pick PDF file
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: AppSizes.spaceBtwItems),
                    child: ElevatedButton(
                      onPressed: () => Get.to(() => const SelectPdfScreen()),
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(double.infinity, 50), // Make button full width
                        backgroundColor: Colors.blueAccent, // Button color
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12), // Rounded corners
                        ),
                        elevation: 5, // Shadow effect for button
                      ),
                      child: const Text(
                        "Upload PDF",
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),

                  // -- Social Media Links (or any footer content)
                  const SizedBox(height: AppSizes.spaceBtwItems),  // Space before footer
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: AppSizes.spaceBtwItems),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.facebook, color: Colors.blue),
                          onPressed: () {
                            // Handle Facebook action
                          },
                        ),
                        IconButton(
                          icon: const Icon(Iconsax.instagram, color: Colors.blue),
                          onPressed: () {
                            // Handle Twitter action
                          },
                        ),
                      ],
                    ),
                  ),

                  // -- Contact/Help Link
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: AppSizes.spaceBtwItems),
                    child: GestureDetector(
                      onTap: () {
                        // Navigate to contact/help page or show modal
                      },
                      child: Text(
                        "Need help? Contact Us",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Footer section
            Container(
              color: Colors.grey[200],  // Footer background color
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Column(
                children: [
                  Text(
                    '© 2024 MindMapify',
                    style: TextStyle(fontSize: 14, color: Colors.black54),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'All Rights Reserved',
                    style: TextStyle(fontSize: 12, color: Colors.black45),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
