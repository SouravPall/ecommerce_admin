import 'package:ecommerce_admin/db/db_helper.dart';
import 'package:flutter/foundation.dart';
import '../models/category_model.dart';
import '../models/product_model.dart';

class ProductProvider extends ChangeNotifier {
  List<ProductModel> productList = [];
  List<CategoryModel> categoryList = [];

  Future<void> addCategory(CategoryModel categoryModel) =>
  DbHelper.addNewCategory(categoryModel);

  getAllCategories() {
    DbHelper.getAllCategories().listen((event) {
      categoryList = List.generate(event.docs.length, (index) =>
          CategoryModel.fromMap(event.docs[index].data()));
      notifyListeners();
    });
  }
}
