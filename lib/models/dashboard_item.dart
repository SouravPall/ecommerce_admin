import 'package:flutter/material.dart';

class DashboardItem{
  IconData icon;
  String title;

  DashboardItem({
    required this.icon,
    required this.title,
  });
  
  static const String product = 'Product';
  static const String category ='Category';
  static const String order = 'Order';
  static const String user ='User';
  static const String report = 'Report';
  static const String settings ='Settings';
}

final List<DashboardItem> dashboardItems = [
  DashboardItem(icon: Icons.card_giftcard, title: DashboardItem.product),
  DashboardItem(icon: Icons.category, title: DashboardItem.category),
  DashboardItem(icon: Icons.add_shopping_cart, title: DashboardItem.order),
  DashboardItem(icon: Icons.person, title: DashboardItem.user),
  DashboardItem(icon: Icons.insert_chart_outlined, title: DashboardItem.report),
  DashboardItem(icon: Icons.settings, title: DashboardItem.settings),
];