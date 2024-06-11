

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_store/features/shop/models/category_model.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class CategoryRepository extends GetxController {
  static CategoryRepository get instance => Get.find();

  /// Variables
  final _db = FirebaseFirestore.instance;

  /// Get all categories
  Future<List<CategoryModel>> getAllCategories() async {
    try {
      final snapshot = await _db.collection('Categories').get();
      final list = snapshot.docs.map((document) => CategoryModel.fromSnapshot(document)).toList();
    return list;
    } on FirebaseException catch(e) {
      throw e;
    } on PlatformException catch(e) {
      throw e;
    } catch(e) {
      throw 'Something went wrong. Please try again';
    }
  }

  /// Get sub categories

  /// Upload categories to firebase

}