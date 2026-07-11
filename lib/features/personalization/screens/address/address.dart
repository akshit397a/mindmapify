import 'package:mindmapify/common/widgets/appbar/appbar.dart';
import 'package:mindmapify/features/personalization/screens/address/widgets/single_address.dart';
import 'package:mindmapify/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class UserAddressScreen extends StatelessWidget {
  const UserAddressScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MyAppBar(
          showBackArrow: true,
          title: Text('Downloads',
              style: Theme.of(context).textTheme.headlineSmall),
        ),
        body: const SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(AppSizes.defaultSpace),
            child: Column(
              children: [
                AppSingleAddress(selectedAddress: false),
              ],
            ),
          ),
        ));
  }
}
