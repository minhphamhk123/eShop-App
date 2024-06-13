import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_store/data/repositories/categories/category_repository.dart';
import 'package:e_store/features/shop/models/category_model.dart';
import 'package:e_store/utils/popups/loaders.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../utils/firebase_storage_services.dart';
import '../../personalization/controllers/user_controller.dart';

class CategoryController extends GetxController {
  static CategoryController get instance => Get.find();

  final isLoading = false.obs;
  final _categoryRepository = Get.put(CategoryRepository());
  final RxList<CategoryModel> allCategories = <CategoryModel>[].obs;
  final RxList<CategoryModel> featuredCategories = <CategoryModel>[].obs;
  final _db = FirebaseFirestore.instance;

  @override
  void onInit() {
    fetchCategories();
    fetch();
    super.onInit();
  }

  fetch() async {
    await UserController.instance.fetchUserRecord();
  }

  Future<void> fetchCategories() async {
    try {
      isLoading.value = true;

      final categories = await _categoryRepository.getAllCategories();

      allCategories.assignAll(categories);

      featuredCategories.assignAll(allCategories.where((category) => category.isFeatured && category.parentId.isEmpty).take(8).toList());


    } catch(e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> uploadDummyData(List<CategoryModel> categories) async {
    try {
      final storage = Get.put(TFirebaseStorageService());

      for (var category in categories) {
        final file = await storage.getImageDataFromAssets(category.image);

        final url = await storage.uploadImageData('Categories', file, category.name);

        category.image = url;
        
        await _db.collection("Categories").doc(category.id).set(category.toJson());
      }
    } on FirebaseException catch (e) {
      throw e;
    } on PlatformException catch (e) {
      throw e;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }
}
