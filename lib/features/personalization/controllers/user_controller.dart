import 'package:e_store/utils/popups/loaders.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:get/get.dart';

import '../models/user_model.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  final String apiUrl = 'http://10.0.2.2:8080/api/auth/google';

  Future<void> saveUserRecord(UserCredential? userCredentials) async {
    try {
      if (userCredentials != null) {
        // Convert Name to First and Last Name
        final nameParts =
            UserModel.nameParts(userCredentials.user!.displayName ?? '');
        final username =
            UserModel.generateUsername(userCredentials.user!.displayName ?? '');

        // Map Data
        final user = UserModel(
          id: userCredentials.user!.uid,
          firstName: nameParts[0],
          lastName: nameParts.length > 1 ? nameParts.sublist(1).join() : '',
          username: username,
          email: userCredentials.user!.email ?? '',
          phoneNumber: userCredentials.user!.phoneNumber ?? '0',
          profilePicture: userCredentials.user!.photoURL ?? '',
        );

        final userJson = user.toJson();
        print(userJson);

        // Send user data to backend API
        final response = await http.post(
          Uri.parse(apiUrl),
          headers: <String, String>{
            'Content-Type': 'application/json',
          },
          body: jsonEncode(userJson),
        );
        // Check response status
        if (response.statusCode == 200) {
          print('User data saved successfully.');
        } else {
          print('Failed to save user data: ${response.reasonPhrase}');
        }
      }
    } catch (e) {
      TLoaders.warningSnackBar(
        title: 'Data not save',
        message:
            'Something went wrong while saving your information. You can re-save your data in your Profile.',
      );
    }
  }
}
