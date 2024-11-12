import 'package:fix_it_solutions/utils/constants/colors.dart';
import 'package:fix_it_solutions/utils/device/device_utility.dart';
import 'package:fix_it_solutions/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class AppTabBar extends StatelessWidget implements PreferredSizeWidget {
  const AppTabBar({super.key, required this.tabs});

  final List<Widget> tabs;

  @override
  Widget build(BuildContext context) {
    final dark = AppHelperFunctions.isDarkMode(context);
    return Material(
      color: dark ? AppColors.black : AppColors.white,
      child: TabBar(
        tabs: tabs,
        isScrollable: true,
        indicatorColor: AppColors.primary,
        labelColor: dark ? AppColors.white : AppColors.primary,
        unselectedLabelColor: AppColors.darkGrey,
        //labelPadding: const EdgeInsets.symmetric(horizontal: 12),
       // indicatorWeight: 4,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(AppDeviceUtils.getAppBarHeight());
}
