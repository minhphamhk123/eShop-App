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

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  /// Variables
  final deviceStorage = GetStorage();
  var client = http.Client();

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
    deviceStorage.read('IsFirstTime') != true ? Get.offAll(() => const LoginScreen()) : Get.offAll(const OnBoardingScreen());
  }

  /* --------------------------------Email & Password sign-in------------------------------*/

  /// [EmailAuthentication] - REGISTER
  Future<String> registerWithEmailAndPassword(String email, String password, String username) async{
    var url = Uri.http('localhost:8080', '/api/auth/signup');
    print(url);
    try {
      http.Response res = await http.post(url, body: jsonEncode({
        'email': email,
        'password': password,
        'username': username,
      }));
      return res.body;
    } catch(e) {
      throw 'Something went wrong. Please try again';
    }
  }

}
