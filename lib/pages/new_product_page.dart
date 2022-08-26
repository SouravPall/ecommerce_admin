import 'package:flutter/material.dart';

class NewProductPage extends StatelessWidget {
  static const routeName ='/newProduct-page';
  const NewProductPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Product'),
      ),
    );
  }
}
