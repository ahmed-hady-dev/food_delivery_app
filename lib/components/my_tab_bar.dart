import 'package:flutter/material.dart';
import 'package:food_delivery_app/models/food.dart';
import 'package:food_delivery_app/themes/theme_provider.dart';
import 'package:provider/provider.dart';

class MyTabBar extends StatelessWidget {
  const MyTabBar({Key? key, required this.tabController}) : super(key: key);
  final TabController tabController;
  List<Tab> _buildCategoryTab() {
    return FoodCategory.values.map((category) {
      return Tab(
        text: category.name.toString().split('.').last.toUpperCase(),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return TabBar(
      labelColor: Provider.of<ThemeProvider>(context).isDarkMode ? null : Colors.black,
      indicatorColor: Provider.of<ThemeProvider>(context).isDarkMode ? null : Theme.of(context).colorScheme.primary,
      controller: tabController,
      tabs: _buildCategoryTab(),
    );
  }
}
