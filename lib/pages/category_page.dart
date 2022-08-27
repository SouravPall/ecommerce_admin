import 'package:ecommerce_admin/models/category_model.dart';
import 'package:ecommerce_admin/providers/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoryPage extends StatelessWidget {
  static const routeName ='/category-page';
  const CategoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Category'),
      ),
      body: Consumer<ProductProvider>(
         builder: (context, provider, _) =>
         provider.categoryList.isEmpty ? Center(
           child: Padding(
             padding: const EdgeInsets.all(8.0),
             child: Column(
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 Image.asset('images/box.png', height: 100),
                  const SizedBox(height: 10,),
                  const Text('No item found!', style: TextStyle(
                    fontSize: 20
                  ),),
               ],
             ),
           ),
         )
             : ListView.builder(
           itemCount: provider.categoryList.length,
           itemBuilder: (context, index) {
             final category = provider.categoryList[index];
             return ListTile(
               title: Text('${category.name} (${category.productCount})'),
             );
           },
         ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          _showAddCategoryBottomSheet(context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  void _showAddCategoryBottomSheet(BuildContext context) {
    final nameController = TextEditingController();
    showModalBottomSheet(
      isScrollControlled: true,
        context: context,
        builder: (context) =>
    DraggableScrollableSheet(
      initialChildSize: 0.6,
      expand: false,
        builder: (context, scrollController) =>
    Card(
      elevation: 5,
      child: ListView(
        controller: scrollController,
        padding: const EdgeInsets.all(16),
        children: [
          TextField(
            controller: nameController,
            decoration: const InputDecoration(
              hintText: 'Enter New Category',
              border: OutlineInputBorder()
            ),
          ),
          const SizedBox(height: 10,),

    //ADD Button
          TextButton(onPressed: () {
            context.read<ProductProvider>()
                .addCategory(CategoryModel(name: nameController.text))
                .then((value) {
              nameController.clear();
            });
          },
            child: const Text('Add'),
          ),
    //Close Button
          TextButton(onPressed: () {
           Navigator.pop(context);
            },
            child: const Text('Close'),
          ),
        ],
      ),
    ))
    );
  }
}
