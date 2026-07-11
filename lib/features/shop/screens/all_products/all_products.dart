import 'package:mindmapify/common/widgets/appbar/appbar.dart';
import 'package:mindmapify/common/widgets/products/sortable/sortable_products.dart';
import 'package:mindmapify/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class AllProducts extends StatelessWidget {
  const AllProducts({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: MyAppBar(
        title: Text('Popular Products'),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(AppSizes.defaultSpace),
          child: AppSortableProducts(),
        ),
      ),
    );
  }
}
