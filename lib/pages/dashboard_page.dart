import 'package:ecommerce_admin/models/dashboard_item.dart';
import 'package:ecommerce_admin/pages/category_page.dart';
import 'package:ecommerce_admin/pages/order_page.dart';
import 'package:ecommerce_admin/pages/product_page.dart';
import 'package:ecommerce_admin/pages/report_page.dart';
import 'package:ecommerce_admin/pages/settings_page.dart';
import 'package:ecommerce_admin/pages/user_page.dart';
import 'package:ecommerce_admin/widgets/dashboard_item_view.dart';
import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  static const String routeName = '/dashboard-page';
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
      ),
      body: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 4,
            mainAxisSpacing: 4,
          ),
          itemCount: dashboardItems.length,
          itemBuilder: (context, index) =>
              DashboardItemView(
                  item: dashboardItems[index],
                  onPressed: (value) {
                    final route = navigate(value);
                    Navigator.pushNamed(context, route);
                  },
              ),
      ),
    );
  }

  String navigate(String value) {
    String route = '';
    switch(value) {
      case DashboardItem.product:
        route = ProductPage.routeName;
        break;
      case DashboardItem.category:
        route = CategoryPage.routeName;
        break;
      case DashboardItem.order:
        route = OrderPage.routeName;
        break;
      case DashboardItem.user:
        route = UserPage.routeName;
        break;
      case DashboardItem.report:
        route = ReportPage.routeName;
        break;
      case DashboardItem.settings:
        route = SettingPage.routeName;
        break;
    }
    return route;
  }
}
