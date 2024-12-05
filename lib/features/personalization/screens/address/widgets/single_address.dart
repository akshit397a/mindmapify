import 'package:fix_it_solutions/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:fix_it_solutions/utils/constants/colors.dart';
import 'package:fix_it_solutions/utils/constants/sizes.dart';
import 'package:fix_it_solutions/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class AppSingleAddress extends StatelessWidget {
  const AppSingleAddress({
    super.key, 
    required this.selectedAddress,
    });

  final bool selectedAddress;

  @override
  Widget build(BuildContext context) {
    final dark = AppHelperFunctions.isDarkMode(context);
    return AppRoundedContainer(
                showBorder: true,
                padding: const EdgeInsets.all(AppSizes.md),
                width: double.infinity,
                backgroundColor: selectedAddress ? AppColors.primary.withOpacity(0.5) : Colors.transparent,
                borderColor: selectedAddress ? Colors.transparent : dark ? AppColors.darkerGrey : AppColors.grey,
                margin: const EdgeInsets.only(bottom: AppSizes.spaceBtwItems),
                child: Stack(
                  children: [
                    Positioned(
                      right: 5,
                      top: 0,
                      child: Icon(
                        selectedAddress ? Iconsax.tick_circle5 : null,
                        color: selectedAddress ? dark ? AppColors.light : AppColors.dark.withOpacity(0.6) : null,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Dear Akshit',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        const SizedBox(height: AppSizes.sm / 2),
                        const Text(
                          '',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: AppSizes.sm / 2),
                        const Text('You don\'t have any downloads yet', softWrap: true),
                      ],
                    )
                  ],
                ),
              );
  }
}
