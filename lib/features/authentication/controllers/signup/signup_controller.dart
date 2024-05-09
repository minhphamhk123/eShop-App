import 'package:e_store/data/network_manager.dart';
import 'package:e_store/utils/constants/image_strings.dart';
import 'package:e_store/utils/popups/full_screen_loader.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../../../utils/popups/loaders.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  //Variables
  final hidePassword = true.obs; //Observable for hiding/showing password
  final privacyPolicy = true.obs; //Observable for checked/unchecked policy
  final email = TextEditingController(); // Controller for email input
  final lastName = TextEditingController(); // Controller for last name input
  final username = TextEditingController(); // Controller for username input
  final password = TextEditingController(); // Controller for password input
  final firstName = TextEditingController(); // Controller for first name input
  final phoneNumber = TextEditingController(); // Controller for phone number input
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>(); // Form key for form validation

  /// -- SIGNUP
  Future<void> signup() async {
    try {
      // Start Loading
      TFullScreenLoader.openLoadingDialog('We are processing your information...', TImages.furnitureIcon);
      // Check Internet Connect
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) return;
      // Form Validation
      if (!signupFormKey.currentState!.validate()) return;
      // Privacy Policy Check
      if (!privacyPolicy.value) {
        TLoaders.warningSnackBar(
            title: 'Accept Privacy Policy',
            message: 'In order to create account, you must have to read and accept the Privacy Policy & Term of Use.');
        return;
      }
      // Register user and save user data in the backend

      // Save Authenticated user data

      // Show Success Message

      // Move to verify Email Screen
    } catch (e) {
      // Show error to user
      TLoaders.errorSnackBar(title: 'Oh Snap!',message: e.toString());
    } finally {
      // Remove Loader
      TFullScreenLoader.stopLoading();
    }
  }
}
