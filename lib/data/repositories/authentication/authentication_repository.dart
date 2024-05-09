import 'dart:io';

import 'package:e_store/navigation_menu.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../features/authentication/screens/login/login.dart';
import '../../../features/authentication/screens/onboarding/onboarding.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  /// Variables
  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;

  /// Called from main.dart on app launch
  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  void screenRedirect() async {
    final user = _auth.currentUser;

    if (user != null) {
      // If the user is logged in
      if (user.emailVerified) {
        // If the user's email is verified, navigate to the main Navigation Menu
        Get.offAll(() => const NavigationMenu());
      } else {
        // Get.offAll(() => VerifyEmailScreen(email: _auth.currentUser?.email));
      }
    } else {
      // Local storage
      deviceStorage.writeIfNull('IsFirstTime', true);

      // Check if it's the first time launching the app
      deviceStorage.read('IsFirstTime') != true
          ? Get.offAll(() =>
              const LoginScreen()) // Redirect to Login Screen if not the first time
          : Get.offAll(
              const OnBoardingScreen()); // Redirect to OnBoarding Screen if it's the first time
    }
  }

/* --------------------------------Email & Password sign-in------------------------------*/

  /// [EmailAuthentication] - LOGIN
  // Future<UserCredential> loginWithEmailAndPassword(String email, String password) async {
  //   try {
  //     return await _auth.signInWithEmailAndPassword(email: email, password: password);
  //   } on FirebaseAuthException catch (e) {
  //     throw TFirebaseAuthException(e.code).message;
  //   } on FirebaseAuthException catch (e) {
  //     throw TFirebaseException(e.code).message;
  //   } on FormatException catch (_) {
  //     throw const TFormatException();
  //   } on PlatformException catch (e) {
  //     throw TPlatformException(e.code).message;
  //   } catch (e) {
  //     throw 'Something went wrong. Please try again';
  //   }
  // }

  /// [EmailAuthentication] - REGISTER
  //   Future<UserCredential> registerWithEmailAndPasswork(String email, String password) async {
  //       try {
  //         return await _auth.signInWithEmailAndPassword(email: email, password: password);
  //       } on FirebaseAuthException catch (e) {
  //         throw TFirebaseAuthException(e.code).message;
  //       } on FirebaseAuthException catch (e) {
  //         throw TFirebaseException(e.code).message;
  //       } on FormatException catch (_) {
  //         throw const TFormatException();
  //       } on PlatformException catch (e) {
  //         throw TPlatformException(e.code).message;
  //       } catch (e) {
  //         throw 'Something went wrong. Please try again';
  //       }
  //   }

  /// [GoogleAuthentication] -GOOGLE
  Future<UserCredential?> signInWithGoogle() async {
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? userAccount = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await userAccount?.authentication;

      // Create a new credential
      final credentials = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // Once signed in, return the UserCredential
      return await _auth.signInWithCredential(credentials);
    // } on FirebaseAuthException catch (e) {
    //   throw TFirebaseAuthException(e.code).message;
    // } on FirebaseAuthException catch (e) {
    //   throw TFirebaseException(e.code).message;
    // } on FormatException catch (_) {
    //   throw const TFormatException();
    // } on PlatformException catch (e) {
    //   throw TPlatformException(e.code).message;
    } catch (e) {
      if (kDebugMode) print('Something went wrong: $e');
      return null;
    }
  }
}
