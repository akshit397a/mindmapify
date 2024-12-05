import 'package:fix_it_solutions/utils/constants/colors.dart';
import 'package:fix_it_solutions/utils/constants/text_strings.dart';
import 'package:fix_it_solutions/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppFormDivider extends StatelessWidget {
  const AppFormDivider({
    super.key,
    required this.dividerText,
  });

  final String dividerText;

  @override
  Widget build(BuildContext context) {
    final dark = AppHelperFunctions.isDarkMode(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          child: Divider(
              color: dark ? AppColors.darkGrey : AppColors.grey,
              thickness: 0.5,
              indent: 60,
              endIndent: 5),
        ),
        Text(AppTexts.orSignInWith.capitalize!,
            style: Theme.of(context).textTheme.labelMedium),
        Flexible(
          child: Divider(
              color: dark ? AppColors.darkGrey : AppColors.grey,
              thickness: 0.5,
              indent: 5,
              endIndent: 60),
        ),
      ],
    );
  }
}