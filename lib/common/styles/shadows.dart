import 'package:fix_it_solutions/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class AppShadowStyles {
  static final verticalProductShadow = BoxShadow(
      color: AppColors.darkGrey.withOpacity(0.1),
      blurRadius: 50,
      spreadRadius: 7,
      offset: const Offset(0, 2));

  static final horizontalProductShadow = BoxShadow(
      color: AppColors.darkGrey.withOpacity(0.1),
      blurRadius: 50,
      spreadRadius: 7,
      offset: const Offset(0, 2));
}
