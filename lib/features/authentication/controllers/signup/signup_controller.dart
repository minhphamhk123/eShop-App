import 'package:e_store/data/network_manager.dart';
import 'package:e_store/data/repositories/authentication/authentication_repository.dart';
import 'package:e_store/features/authentication/screens/signup/verify_email.dart';
import 'package:e_store/utils/constants/image_strings.dart';
import 'package:e_store/utils/popups/full_screen_loader.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../../../utils/popups/loaders.dart';
import '../../../personalization/models/user_model.dart';

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
  final phoneNumber =
      TextEditingController(); // Controller for phone number input
  GlobalKey<FormState> signupFormKey =
      GlobalKey<FormState>(); // Form key for form validation

  final user = Rxn<UserModel>();

  /// -- SIGNUP
  void signup() async {
    try {
      // Start Loading
      TFullScreenLoader.openLoadingDialog(
          'We are processing your information...', TImages.verifyIllustration);

      // Check Internet Connect
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected){
        // Remove Loader
        TFullScreenLoader.stopLoading();
        return;
      }

      // Form Validation
      if (!signupFormKey.currentState!.validate()) {
        // Remove Loader
        TFullScreenLoader.stopLoading();
        return;
      }

      // Privacy Policy Check
      if (!privacyPolicy.value) {
        TLoaders.warningSnackBar(
            title: 'Accept Privacy Policy',
            message:
                'In order to create account, you must have to read and accept the Privacy Policy & Term of Use.');
        return;
      }

      // Register user and save user data in the backend
      final userCredential = await AuthenticationRepository.instance
          .registerWithEmailAndPassword(
              email.text.trim(), password.text.trim(), username.text.trim(), firstName.text.trim(), lastName.text.trim(), phoneNumber.text.trim());

      if(userCredential == '') {
        // Remove Loader
        TFullScreenLoader.stopLoading();
        TLoaders.errorSnackBar(title: 'Oh Snap!', message: 'Something went wrong. Please try again');
        return;
      }

      // Save Authenticated user data
        final newUser = UserModel(
          id: userCredential,
          firstName: firstName.text.trim(),
          lastName: lastName.text.trim(),
          username: username.text.trim(),
          email: email.text.trim(),
          phoneNumber: phoneNumber.text.trim(),
          profilePicture: '',
        );

      // Update the user state
      user.value = newUser;

      // Remove Loader
      TFullScreenLoader.stopLoading();

      // Show Success Message
      TLoaders.successSnackBar(title: 'Congratulation', message: 'Your account has been created! Verify to continue.');

      // Move to verify Email Screen
      Get.to(()=> VerifyScreen(email: email.text.trim()));

    } catch (e) {
      // Remove Loader
      TFullScreenLoader.stopLoading();

      // Show error to user
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
