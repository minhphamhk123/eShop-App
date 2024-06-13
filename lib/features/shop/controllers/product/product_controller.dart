import 'package:e_store/data/repositories/products/product_repository.dart';
import 'package:e_store/features/shop/models/product_model.dart';
import 'package:e_store/utils/popups/loaders.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  static ProductController get instance => Get.find();

  final isLoading = false.obs;
  final productRepository = Get.put(ProductRepository());
  RxList<ProductModel> products = <ProductModel>[].obs;
  RxList<ProductModel> searchResults = <ProductModel>[].obs;
  RxList<ProductModel> categoryProducts = <ProductModel>[].obs;

  @override
  void onInit() {
    fetchAllProducts();
    super.onInit();
  }

  Future<void> fetchAllProducts() async {
    try {
      isLoading.value = true;
      final products = await productRepository.fetchAllProducts();
      this.products.assignAll(products);
    } catch (e) {
      TLoaders.errorSnackBar(title: "Oh Snap!", message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  String calculateDiscountedPrice(double price, double discountPercentage) {
    double discountedPrice = price * (1 - discountPercentage / 100);
    String formattedPrice = discountedPrice.toStringAsFixed(2);
    return formattedPrice;
  }

  String getStockStatus(int stock) {
    return stock > 0 ? 'In Stock' : 'Out of Stock';
  }

  Future<List<ProductModel>>? searchProducts(String query) async {
    try {
      isLoading(true);
      List<ProductModel> products = await productRepository.searchProducts(query);
      searchResults.value = products;
      return products;
    } catch (e) {
      print(e);
      throw 'Something Wrong';
    } finally {
      isLoading(false);
    }
  }

  Future<List<ProductModel>>? fetchProductsByCategory(String category) async {
    try {
      isLoading(true);
      List<ProductModel> products = await productRepository.fetchProductsByCategory(category);
      categoryProducts.value = products;
      return products;
    } catch (e) {
      print(e);
      throw 'Something Wrong';
    } finally {
      isLoading(false);
    }
  }
}
