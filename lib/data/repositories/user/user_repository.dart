import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_store/data/repositories/authentication/authentication_repository.dart';
import 'package:e_store/features/personalization/models/user_model.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

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
      if (res.statusCode == 202) {
        // Handle the successful response
        print('Request successful: ${res.body}');
        return UserModel.fromJsonJV(jsonDecode(res.body));
      } else {
        print('Request fail: ${res.body}');
        throw 'Fail to fetch data';
      }
    } catch (e) {
      print(e);
      throw 'Something went wrong. Please try again';
    }
  }

  /// [Update user]
  Future<UserModel> updateUserDetails(String email,
      String username,
      String firstName,
      String lastName,
      String phoneNumber, String profilePicture) async {
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
            'profilePicture': profilePicture,
            'address': {},
          })
      );
      if (res.statusCode == 202) {
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

  Future<String> deleteUserDetails(String email, String password) async {
    var url = Uri.http('$ip:8009', '/customer');
    var token = await storage.read(key: 'access_token');
    try {
      http.Response res = await http.delete(url,
        headers: {
          'Content-Type': 'application/json',
          'token': 'customer_$token', // Add the token here
        },
          body: jsonEncode({
            'emailId': email,
            'password': password,
          })
      );
      if (res.statusCode == 202) {
        // Handle the successful response
        print('Request successful: ${res.body}');
        return '';
      } else {
        throw 'Something went wrong. Please try again';
      }
    } catch (e) {
      print(e);
      throw 'Something went wrong. Please try again';
    }
  }

  Future<String> uploadImage(String path, XFile image) async {
    try {
      final ref = FirebaseStorage.instance.ref(path).child(image.name);
      await ref.putFile(File(image.path));
      final url = await ref.getDownloadURL();
      return url;

    } on FirebaseException catch(e) {
      throw e;
    } on PlatformException catch(e) {
      throw e;
    } catch(e) {
      throw 'Something went wrong. Please try again';
    }
  }

}