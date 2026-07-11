import 'package:mindmapify/common/widgets/appbar/appbar.dart';
import 'package:mindmapify/common/widgets/icons/circular_icon.dart';
import 'package:mindmapify/features/shop/screens/home/home.dart';
import 'package:mindmapify/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title:
            Text('Download', style: Theme.of(context).textTheme.headlineMedium),
        actions: [
          AppCircularIcon(
              icon: Iconsax.document_download4,
              onPressed: () => Get.to(const HomeScreen())),
        ],
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(AppSizes.defaultSpace),
          child: Column(
            children: [],
          ),
        ),
      ),
    );
  }
}
