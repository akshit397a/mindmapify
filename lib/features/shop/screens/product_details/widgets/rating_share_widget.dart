import 'package:fix_it_solutions/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class AppRatingAndShare extends StatelessWidget {
  const AppRatingAndShare({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Rating
        Row(
          children: [
            const Icon(
              Iconsax.star5, 
              color: Colors.amber, 
              size: 24,
              ),
              const SizedBox(width: AppSizes.spaceBtwItems / 2),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(text: '5.0', style: Theme.of(context).textTheme.bodyLarge),
                    const TextSpan(text: '(199)'),
                  ],
                ),
              ),
          ],
          ),
          // Share Button
          IconButton(onPressed: () {}, 
          icon: const Icon(Icons.share, size: AppSizes.iconMd),
          ),
      ],
    );
  }
}