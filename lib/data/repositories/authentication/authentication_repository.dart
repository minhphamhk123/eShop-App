import 'dart:convert';

import 'package:e_store/features/authentication/screens/signup/verify_email.dart';
import 'package:e_store/navigation_menu.dart';
import 'package:e_store/utils/popups/loaders.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

import '../../../features/authentication/controllers/signup/signup_controller.dart';
import '../../../features/authentication/screens/login/login.dart';
import '../../../features/authentication/screens/onboarding/onboarding.dart';
import '../../../features/personalization/models/user_model.dart';
import '../../../socket_service.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  /// Variables
  final deviceStorage = GetStorage();
  final storage = const FlutterSecureStorage();
  final user = Rxn<UserModel>();

  // var client = http.Client();

  /// Called from main.dart on app launch
  @override
  void onReady() {
    // Remove the native splash screen
    FlutterNativeSplash.remove();
    //Redirect to the appropriate screen
    screenRedirect();
  }

  Future<UserModel?> getUser() async {
    String? userJson = await storage.read(key: 'user');
    if (userJson != null) {
      Map<String, dynamic> userMap = json.decode(userJson);
      return UserModel.fromJson(userMap);
    }
    return null;
  }

  screenRedirect() async {
    var verify = deviceStorage.read('IsVerify');
    user.value = await getUser();
    if (user.value != null) {
      if (verify == 'true') {
        Get.offAll(() => const NavigationMenu());
      } else {
        Get.offAll(() => VerifyScreen(
              email: user.value?.email,
            ));
      }
    } else {
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
      String email,
      String password,
      String username,
      String firstName,
      String lastName,
      String phoneNumber) async {
    var url = Uri.http('192.168.1.2:8080', '/api/auth/signup');
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

  /// [EmailAuthentication] - Sign In
  Future<void> login(String username, String password) async {
    var url = Uri.http('192.168.1.2:8080', '/api/auth/signin');
    try {
      http.Response res = await http.post(url,
          body: jsonEncode({
            'username': username,
            'password': password,
          }),
          headers: {'Content-Type': 'application/json'});

      if (res.statusCode == 200) {
        final responseBody = json.decode(res.body);
        final token = responseBody['user']['token'];
        await storage.write(key: 'access_token', value: token);
        print('Extracted token: $token');
      } else {
        throw Exception('Failed to sign in');
      }
    } catch (e) {
      print(e);
      throw 'Something went wrong. Please try again';
    }
  }

  /// [Re_send email]
  Future<void> sendEmail(String id, String email) async {
    var url = Uri.http('192.168.1.2:8080', '/api/auth/verify/sendemail');
    try {
      http.Response res = await http.post(url,
          body: jsonEncode({
            '_id': id,
            'email': email,
          }),
          headers: {'Content-Type': 'application/json'}
      );
      print(res);
    } catch(e) {
      print(e);
      throw 'Something went wrong. Please try again';
    }
  }

  /// [LogoutUser] - Valid for any authentication
  Future<void> logout() async {
    // Xóa token từ storage
    await storage.delete(key: 'access_token');
    await storage.delete(key: 'user');
    await storage.delete(key: 'IsVerify');
    Get.offAll(() => const LoginScreen());

    var url = Uri.http('192.168.1.2:8080', '/api/auth/signout');
    try {
      http.Response res = await http.get(url);
      print(res);
      if (res.statusCode != 200) {
        throw Exception('Failed to sign out');
      }
    } catch (e) {
      print(e);
      throw 'Something went wrong. Please try again';
    }
  }
}
