import 'package:fix_it_solutions/common/widgets/appbar/appbar.dart';
import 'package:fix_it_solutions/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:fix_it_solutions/common/widgets/products/cart/coupon_widget.dart';
import 'package:fix_it_solutions/common/widgets/success_screen/success_screen.dart';
import 'package:fix_it_solutions/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:fix_it_solutions/features/shop/screens/checkout/widgets/billing_address_section.dart';
import 'package:fix_it_solutions/features/shop/screens/checkout/widgets/billing_amount_section.dart';
import 'package:fix_it_solutions/features/shop/screens/checkout/widgets/billing_payment_section.dart';
import 'package:fix_it_solutions/navigation_menu.dart';
import 'package:fix_it_solutions/utils/constants/colors.dart';
import 'package:fix_it_solutions/utils/constants/image_strings.dart';
import 'package:fix_it_solutions/utils/constants/sizes.dart';
import 'package:fix_it_solutions/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final dark = AppHelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: MyAppBar(
          showBackArrow: true,
          title: Text('Order Review',
              style: Theme.of(context).textTheme.headlineSmall)),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.defaultSpace),
          child: Column(
            children: [
              // -- Items in Cart
              const AppCartItems(showAddRemoveButtons: false),
              const SizedBox(height: AppSizes.spaceBtwSections),

              // -- Coupon TextField
              const AppCouponCode(),
              const SizedBox(height: AppSizes.spaceBtwSections),

              // -- Billing Section
              AppRoundedContainer(
                showBorder: true,
                padding: const EdgeInsets.all(AppSizes.md),
                backgroundColor: dark ? AppColors.black : AppColors.white,
                child: const Column(
                  children: [
                    // Pricing
                    AppBillingAmountSection(),
                    SizedBox(height: AppSizes.spaceBtwItems),

                    // Divider
                    Divider(),
                    SizedBox(height: AppSizes.spaceBtwItems),

                    // Payment Methods
                    AppBillingPaymentSection(),
                    SizedBox(height: AppSizes.spaceBtwItems),

                    // Address
                    AppBillingAddressSection(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),

      // Checkout Button
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(AppSizes.defaultSpace),
        child: ElevatedButton(
            onPressed: () => Get.to(() => SuccessScreen(
              image: AppImages.successfulPaymentIcon,
              title: 'Payment Success!',
              subTitle: 'Your item will be shipped soon!',
              onPressed: () => Get.offAll(() => const NavigationMenu()),
                ),
              ),
            child: const Text('Continue Shopping')),
      ),
    );
  }
}
