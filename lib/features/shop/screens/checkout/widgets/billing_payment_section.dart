import 'package:fix_it_solutions/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:fix_it_solutions/common/widgets/texts/section_heading.dart';
import 'package:fix_it_solutions/utils/constants/colors.dart';
import 'package:fix_it_solutions/utils/constants/image_strings.dart';
import 'package:fix_it_solutions/utils/constants/sizes.dart';
import 'package:fix_it_solutions/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class AppBillingPaymentSection extends StatelessWidget {
  const AppBillingPaymentSection({super.key});
  @override
  Widget build(BuildContext context) {
    final dark = AppHelperFunctions.isDarkMode(context);
    return Column(
      children: [
        AppSectionHeading(
            title: 'Payment Method', buttonTitle: 'Change', onPressed: () {}),
        const SizedBox(height: AppSizes.spaceBtwItems / 2),
        Row(
          children: [
            AppRoundedContainer(
              width: 60,
              height: 48,
              backgroundColor: dark ? AppColors.light : AppColors.white,
              padding: const EdgeInsets.all(AppSizes.sm),
              child: const Image(
                  image: AssetImage(AppImages.paypal), fit: BoxFit.contain),
            ),
            const SizedBox(width: AppSizes.spaceBtwItems / 2),
            Text('Paypal', style: Theme.of(context).textTheme.bodyLarge),
          ],
        ),
      ],
    );
  }
}
