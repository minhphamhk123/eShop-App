import 'dart:convert';

import 'package:e_store/utils/popups/loaders.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

import '../../../features/authentication/screens/login/login.dart';
import '../../../features/authentication/screens/onboarding/onboarding.dart';
import '../../../socket_service.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  /// Variables
  final deviceStorage = GetStorage();
  // var client = http.Client();

  /// Called from main.dart on app launch
  @override
  void onReady() {
    // Remove the native splash screen
    FlutterNativeSplash.remove();
    //Redirect to the appropriate screen
    screenRedirect();
  }

  screenRedirect() async {



    // Local storage
    if (kDebugMode) {
      print('=============== GET STORAGE Auth Repo ====================');
      print(deviceStorage.read('IsFirstTime'));
    }

    deviceStorage.writeIfNull('IsFirstTime', true);
    deviceStorage.read('IsFirstTime') != true
        ? Get.offAll(() => const LoginScreen())
        : Get.offAll(const OnBoardingScreen());
  }

  Future<String> handleResponse(String responseString) async {
    Map<String, dynamic> responseMap = jsonDecode(responseString);

    if (responseMap['status'] == 'PENDING') {
      String userId = responseMap['data']['user'];
      print('Extracted user ID: $userId');
      return userId;
      // Use the user ID for further processing, display, etc.
    } else {
      print('Unexpected response status: ${responseMap['status']}');
      return '';
    }
  }

  /* --------------------------------Email & Password sign-in------------------------------*/

  /// [EmailAuthentication] - REGISTER
  Future<String> registerWithEmailAndPassword(
      String email, String password, String username, String firstName, String lastName, String phoneNumber) async {
    var url = Uri.http('192.168.1.3:8080', '/api/auth/signup');
    try {
      http.Response res = await http.post(url,
          body: jsonEncode({
            'email': email,
            'password': password,
            'username': username,
            'firstName': firstName,
            'lastName': lastName,
            'phoneNumber': phoneNumber,
          }),
          headers: {'Content-Type': 'application/json'});
      final test = res.body;
      print(test);
      return await handleResponse(test);
    } catch (e) {
      print(e);
      throw 'Something went wrong. Please try again';
    }
  }

  /// [EmailAuthentication] - SET USER

}
