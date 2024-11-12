import 'package:fix_it_solutions/common/widgets/appbar/appbar.dart';
import 'package:fix_it_solutions/features/shop/screens/order/widgets/orders_list.dart';
import 'package:fix_it_solutions/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // -- AppBar
      appBar: MyAppBar(title: Text('My Orders', style: Theme.of(context).textTheme.headlineSmall),
      showBackArrow: true,
      ),
      body: const Padding(padding: EdgeInsets.all(AppSizes.defaultSpace),

      // -- Orders
      child: AppOrderListItems(),
      ),
    );
  }
}