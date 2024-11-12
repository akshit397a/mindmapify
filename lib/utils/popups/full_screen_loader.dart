import 'package:fix_it_solutions/common/widgets/loaders/animation_loader.dart';
import 'package:fix_it_solutions/utils/constants/colors.dart';
import 'package:fix_it_solutions/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppFullScreenLoader {
  static void openLoadingDialog(String text, String animation) {
    showDialog(
      context: Get.overlayContext!,
      barrierDismissible:
          false, // the dialog can't be dismissed by tapping outside it
      builder: (_) => PopScope(
        canPop: false, // disable popping with the back button
        child: Container(
          color: AppHelperFunctions.isDarkMode(Get.context!)
              ? AppColors.dark
              : AppColors.white,
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              const SizedBox(height: 250),
              AppAnimationLoaderWidget(text: text, animation: animation),
            ],
          ),
        ),
      ),
    );
  }

  // Stop the currently open loading dialog.
  // This method doesn't return anything.
  static stopLoading() {
    Navigator.of(Get.overlayContext!).pop(); // close the dialog using navigator
  }
}
