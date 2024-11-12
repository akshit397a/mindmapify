import 'package:fix_it_solutions/common/widgets/texts/section_heading.dart';
import 'package:fix_it_solutions/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class AppBillingAddressSection extends StatelessWidget {
  const AppBillingAddressSection({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppSectionHeading(
            title: 'Shipping Address', buttonTitle: 'Change', onPressed: () {}),
        Text('Akshit Agarwal', style: Theme.of(context).textTheme.bodyLarge),
        const SizedBox(width: AppSizes.spaceBtwItems / 2),

        Row(
          children: [
            const Icon(Icons.phone, color: Colors.grey, size: 16),
            const SizedBox(width: AppSizes.spaceBtwItems),
            Text('+91-9897241287', style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        const SizedBox(width: AppSizes.spaceBtwItems / 2),

        Row(
          children: [
            const Icon(Icons.location_history, color: Colors.grey, size: 16),
            const SizedBox(width: AppSizes.spaceBtwItems),
            Expanded(child: Text('268/6 Shastri Nagar, Meerut, India', style: Theme.of(context).textTheme.bodyMedium, softWrap: true)),
          ],
        ),
      ],
    );
  }
}
