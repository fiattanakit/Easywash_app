import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/Food.dart';

class MyTabBar extends StatelessWidget {
  final TabController tabController;

  const MyTabBar({
    super.key,
    required this.tabController,
  });

  List<Tab> _buildCategoryTabs() {
    return FoodCategory.values.map((category) {
      return Tab(
        text: category .toString().split('.') .last, // แยกชื่อ enum เพื่อให้แสดงเฉพาะชื่อหมวดหมู่
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TabBar(
        controller: tabController, // คอนโทรลเลอร์ของ TabBar
        tabs: _buildCategoryTabs(), // สร้างแท็บจากหมวดหมู่
      ),
    );
  }
}
