import 'dart:convert';
import 'dart:io';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../features/shop/models/product_model.dart';

class ProductRepository extends GetxController {
  static ProductRepository get instance => Get.find();

  /// [Fetch all products]
  Future<List<ProductModel>> fetchAllProducts() async {
    var url = Uri.parse('https://dummyjson.com/products');

    try {
      http.Response res = await http.get(url,
        headers: {
          'Content-Type': 'application/json',
        },
      );

      if (res.statusCode == 200) {
        // Parse the JSON data
        Map<String, dynamic> jsonData = jsonDecode(res.body);
        List<dynamic> productsJson = jsonData['products'];

        // Convert JSON data to ProductModel objects
        List<ProductModel> products = productsJson.map((productJson) => ProductModel.fromJson(productJson)).toList();
        // print(products);
        return products;
      } else {
        print('Request failed: ${res.body}');
        throw 'Failed to fetch products';
      }
    } catch (e) {
      print(e);
      throw 'Something went wrong. Please try again';
    }
  }

  // Hàm search sản phẩm
  Future<List<ProductModel>> searchProducts(String query) async {
    var url = Uri.parse('https://dummyjson.com/products/search?q=$query');

    try {
      http.Response res = await http.get(url,
        headers: {
          'Content-Type': 'application/json',
        },
      );

      if (res.statusCode == 200) {
        // Parse the JSON data
        Map<String, dynamic> jsonData = jsonDecode(res.body);
        List<dynamic> productsJson = jsonData['products'];

        // Convert JSON data to ProductModel objects
        List<ProductModel> products = productsJson.map((productJson) => ProductModel.fromJson(productJson)).toList();
        return products;
      } else {
        print('Request failed: ${res.body}');
        throw 'Failed to search products';
      }
    } catch (e) {
      print(e);
      throw 'Something went wrong. Please try again';
    }
  }


  // Hàm fetch sản phẩm theo danh mục
  Future<List<ProductModel>> fetchProductsByCategory(String category) async {
    var url = Uri.parse('https://dummyjson.com/products/category/$category');

    try {
      http.Response res = await http.get(url,
        headers: {
          'Content-Type': 'application/json',
        },
      );

      if (res.statusCode == 200) {
        // Parse the JSON data
        Map<String, dynamic> jsonData = jsonDecode(res.body);
        List<dynamic> productsJson = jsonData['products'];

        // Convert JSON data to ProductModel objects
        List<ProductModel> products = productsJson.map((productJson) => ProductModel.fromJson(productJson)).toList();
        return products;
      } else {
        print('Request failed: ${res.body}');
        throw 'Failed to fetch products by category';
      }
    } catch (e) {
      print(e);
      throw 'Something went wrong. Please try again';
    }
  }

}
