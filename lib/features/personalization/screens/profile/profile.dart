import 'package:fix_it_solutions/common/widgets/appbar/appbar.dart';
import 'package:fix_it_solutions/common/widgets/images/circular_image.dart';
import 'package:fix_it_solutions/common/widgets/texts/section_heading.dart';
import 'package:fix_it_solutions/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:fix_it_solutions/utils/constants/image_strings.dart';
import 'package:fix_it_solutions/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(
        showBackArrow: true,
        title: Text('Profile'),
      ),
      // -- Body
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(AppSizes.defaultSpace),
            child: Column(
              children: [
                // Profile Picture
                SizedBox(
                  width: double.infinity,
                  child: Column(
                    children: [
                      const AppCircularImage(
                          image: AppImages.user, width: 80, height: 80),
                      TextButton(
                          onPressed: () {},
                          child: const Text('Change Profile Picture')),
                    ],
                  ),
                ),

                // Details
                const SizedBox(height: AppSizes.spaceBtwItems / 2),
                const Divider(),
                const SizedBox(height: AppSizes.spaceBtwItems),

                // Heading Profile Info
                const AppSectionHeading(
                    title: 'Profile Information', showActionButton: false),
                const SizedBox(height: AppSizes.spaceBtwItems),

                AppProfileMenu(title: 'Name', value: 'Akshit Agarwal', onPressed: () {}),
                AppProfileMenu(title: 'Username', value: 'akshit397', onPressed: () {}),

                const SizedBox(height: AppSizes.spaceBtwItems),
                const Divider(),
                const SizedBox(height: AppSizes.spaceBtwItems),

                // Heading Personal Info
                const AppSectionHeading(
                    title: 'Personal Information', showActionButton: false),
                const SizedBox(height: AppSizes.spaceBtwItems),

                AppProfileMenu(title: 'User ID', value: '2300520100106', icon: Iconsax.copy, onPressed: () {}),
                AppProfileMenu(title: 'E-mail', value: 'a.04agarwal@gmail.com', onPressed: () {}),
                AppProfileMenu(title: 'Phone Number', value: '+91-9897241287', onPressed: () {}),
                AppProfileMenu(title: 'Gender', value: 'Male', onPressed: () {}),
                AppProfileMenu(title: 'Date of Birth', value: '30 Nov 2004', onPressed: () {}),
                const Divider(),
                const SizedBox(height: AppSizes.spaceBtwItems),

                Center(
                  child: TextButton(
                    onPressed: () {}, 
                    child: const Text(
                      'Delete Account',
                      style: TextStyle(color: Colors.red),
                    ),
                    ),
                ),
              ],
            )),
      ),
    );
  }
}

