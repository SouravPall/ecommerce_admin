import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_admin/models/category_model.dart';

class DbHelper{

  static const String collectionAdmin = 'Admins';
  static const String collectionCategory = 'Categories';
  static final FirebaseFirestore _db = FirebaseFirestore.instance;

  //login query
  static Future<bool> isAdmin(String uid) async{
    final snapshot  = await _db.collection(collectionAdmin).doc(uid).get();
    return snapshot.exists;
  }

  //category query
  static Future<void> addNewCategory(CategoryModel categoryModel) {
    final doc = _db.collection(collectionCategory).doc();
    categoryModel.id = doc.id;
    return doc.set(categoryModel.toMap());
  }
  //collection to all category GET query
  static Stream<QuerySnapshot<Map<String, dynamic >>> getAllCategories() =>
      _db.collection(collectionCategory).snapshots();

}