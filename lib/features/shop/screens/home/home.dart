import 'package:file_picker/file_picker.dart'; 
import 'package:fix_it_solutions/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:fix_it_solutions/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:fix_it_solutions/common/widgets/texts/section_heading.dart';
import 'package:fix_it_solutions/features/shop/screens/all_products/all_products.dart';
import 'package:fix_it_solutions/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:fix_it_solutions/features/shop/screens/home/widgets/promo_slider.dart';
import 'package:fix_it_solutions/mindmap.dart';
import 'package:fix_it_solutions/select_pdf_screen.dart';
import 'package:fix_it_solutions/utils/constants/image_strings.dart';
import 'package:fix_it_solutions/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
                  SizedBox(height: AppSizes.spaceBtwSections),

                  // -- SearchBar
                  AppSearchContainer(text: 'Search PDF'),
                  SizedBox(height: AppSizes.spaceBtwSections),
                
                  SizedBox(height: AppSizes.spaceBtwSections),
                ],
              ),
            ),

            // --body
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
                  const SizedBox(height: AppSizes.spaceBtwSections),

                  // -- Heading
                  AppSectionHeading(
                    title: 'Upload PDF',
                    buttonTitle: '',
                    onPressed: () => Get.to(() => const AllProducts()),
                  ),
                  const SizedBox(height: AppSizes.spaceBtwItems),

                  // -- Browse Button to pick PDF file
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: AppSizes.spaceBtwItems),
                    child: ElevatedButton(
                      onPressed: () => Get.to(() => const SelectPdfScreen()),
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(double.infinity, 50), // Make button full width
                      ), // Handle file picking
                      child: const Text("Upload PDF"),
                    ),
                  ),

                   Padding(
                    padding: const EdgeInsets.symmetric(vertical: AppSizes.spaceBtwItems),
                    child: ElevatedButton(
                      onPressed: () => Get.to(() => const MindmapScreen()),
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(double.infinity, 50), // Make button full width
                      ), // Handle file picking
                      child: const Text("Convert to Mindmap"),
                    ),
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

