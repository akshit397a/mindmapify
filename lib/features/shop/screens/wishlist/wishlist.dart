import 'package:fix_it_solutions/common/widgets/appbar/appbar.dart';
import 'package:fix_it_solutions/common/widgets/icons/circular_icon.dart';
import 'package:fix_it_solutions/features/shop/screens/home/home.dart';
import 'package:fix_it_solutions/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: Text('Download', style: Theme.of(context).textTheme.headlineMedium),
        actions: [
          AppCircularIcon(icon: Iconsax.document_download4, onPressed: () => Get.to(const HomeScreen())),
        ],
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(AppSizes.defaultSpace),
          child: Column(children: [
            
            ],
            ),
          ),
      ),
    );
  }
}
