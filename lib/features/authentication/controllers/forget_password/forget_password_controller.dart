

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../data/network_manager.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/popups/full_screen_loader.dart';

class ForgetPasswordController extends GetxController {
  static ForgetPasswordController get instance => Get.find();

  /// Variables
  final email = TextEditingController(); // Controller for email input
  GlobalKey<FormState> forgetPasswordFormKey =
  GlobalKey<FormState>();

  /// Send reset password email
  sendResetPasswordEmail() async {
    try {
      // Start Loading
      TFullScreenLoader.openLoadingDialog(
          'We are processing your information...', TImages.loaderAnimation);

      // Check Internet Connect
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected){
        // Remove Loader
        TFullScreenLoader.stopLoading();
        return;
      }

      // Form Validation
      if (!forgetPasswordFormKey.currentState!.validate()) {
        // Remove Loader
        TFullScreenLoader.stopLoading();
        return;
      }

      // Send email to reset password
    } catch(e) {

    }
  }

  resendPasswordResetEmail(String email) async {
    try {

    } catch(e) {

    }
  }

}