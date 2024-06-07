import 'dart:convert';

import 'package:e_store/data/repositories/authentication/authentication_repository.dart';
import 'package:e_store/features/personalization/models/user_model.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final ip = dotenv.env['IP'] ?? 'IP not found';

  /// Variables
  final storage = const FlutterSecureStorage();


  /// [Fetch data]
  Future<UserModel> fetchUserDetails() async {
    var url = Uri.http('$ip:8009', '/customer/current');
    var token = await storage.read(key: 'access_token');
    try {
      http.Response res = await http.get(url,
        headers: {
          'Content-Type': 'application/json',
          'token': 'customer_$token', // Add the token here
        },
      );
      if (res.statusCode == 200) {
        // Handle the successful response
        print('Request successful: ${res.body}');
        Map<String, dynamic> responseBody = jsonDecode(res.body);
        return AuthenticationRepository.instance.user.value = UserModel.fromJsonJV(responseBody);
      } else {
        throw 'Something went wrong. Please try again';
      }
    } catch (e) {
      print(e);
      throw 'Something went wrong. Please try again';
    }
  }

  /// [Update user]
  Future<UserModel> updateUserDetails(String email,
      String password,
      String username,
      String firstName,
      String lastName,
      String phoneNumber) async {
    var url = Uri.http('$ip:8009', '/customer');
    var token = await storage.read(key: 'access_token');
    try {
      http.Response res = await http.put(url,
        headers: {
          'Content-Type': 'application/json',
          'token': 'customer_$token', // Add the token here
        },
          body: jsonEncode({
            'emailId': email,
            'firstName': firstName,
            'lastName': lastName,
            'mobileNo': phoneNumber,
            'address': '',
          })
      );
      if (res.statusCode == 200) {
        // Handle the successful response
        print('Request successful: ${res.body}');
        Map<String, dynamic> responseBody = jsonDecode(res.body);
        return AuthenticationRepository.instance.user.value = UserModel.fromJsonJV(responseBody);
      } else {
        throw 'Something went wrong. Please try again';
      }
    } catch (e) {
      print(e);
      throw 'Something went wrong. Please try again';
    }
  }


}