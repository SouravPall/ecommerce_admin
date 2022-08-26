import 'package:ecommerce_admin/pages/category_page.dart';
import 'package:ecommerce_admin/pages/dashboard_page.dart';
import 'package:ecommerce_admin/pages/launcher_page.dart';
import 'package:ecommerce_admin/pages/login_page.dart';
import 'package:ecommerce_admin/pages/new_product_page.dart';
import 'package:ecommerce_admin/pages/order_page.dart';
import 'package:ecommerce_admin/pages/product_page.dart';
import 'package:ecommerce_admin/pages/report_page.dart';
import 'package:ecommerce_admin/pages/settings_page.dart';
import 'package:ecommerce_admin/pages/splash_screen_page.dart';
import 'package:ecommerce_admin/pages/user_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'E-commerce Admin',
      theme: ThemeData(
        primarySwatch: Colors.green
      ),
      initialRoute: SplashScreenPage.routeName,
      routes: {
        SplashScreenPage.routeName : (_) => SplashScreenPage(),
        LauncherPage.routeName : (_) => LauncherPage(),
        LoginPage.routeName : (_) => LoginPage(),
        DashboardPage.routeName : (_) => DashboardPage(),
        ProductPage.routeName : (_) => ProductPage(),
        CategoryPage.routeName: (_) => CategoryPage(),
        OrderPage.routeName: (_) => OrderPage(),
        UserPage.routeName: (_) => UserPage(),
        ReportPage.routeName: (_) => ReportPage(),
        SettingPage.routeName: (_) => SettingPage(),
        NewProductPage.routeName: (_) => NewProductPage(),
      },
    );
  }
}

