import 'package:ecommerce_admin/pages/new_product_page.dart';
import 'package:flutter/material.dart';

class ProductPage extends StatelessWidget {
  static const routeName ='/product-page';
  const ProductPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, NewProductsPage.routeName),
        child: const Icon(Icons.add),
      ),
    );
  }
}
