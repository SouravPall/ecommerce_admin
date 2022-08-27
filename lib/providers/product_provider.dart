
import 'dart:io';

import 'package:ecommerce_admin/db/db_helper.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
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

  Future<String> updateImage(XFile xFile) async {
    final imageName = DateTime.now().millisecondsSinceEpoch.toString();
    final photoRef = FirebaseStorage.instance.ref().child('pictures/$imageName');
    final uploadTask = photoRef.putFile(File(xFile.path));
    final snapshot = await uploadTask.whenComplete(() => null);
    return snapshot.ref.getDownloadURL();
  }
}
