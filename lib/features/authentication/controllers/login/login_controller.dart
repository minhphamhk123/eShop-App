import 'package:e_store/data/network_manager.dart';
import 'package:e_store/utils/constants/image_strings.dart';
import 'package:e_store/utils/popups/full_screen_loader.dart';
import 'package:e_store/utils/popups/loaders.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../data/repositories/authentication/authentication_repository.dart';
import '../../../../navigation_menu.dart';


class LoginController extends GetxController {
  static LoginController get instance => Get.find();

  final storage = const FlutterSecureStorage();
  final localStorage = GetStorage();

  /// Variables
  final rememberMe = false.obs;
  final hidePassword = true.obs; //Observable for hiding/showing password
  final email = TextEditingController(); // Controller for username input
  final password = TextEditingController(); // Controller for password input
  GlobalKey<FormState> loginFormKey =
  GlobalKey<FormState>();

  @override
  void onInit() {
    email.text = localStorage.read('REMEMBER_ME_EMAIL');
    password.text = localStorage.read('REMEMBER_ME_PASSWORD');
    super.onInit();
  } // Form key for form validation

  Future<void> loginWithEmail() async {
    try {
      // Start loading
      TFullScreenLoader.openLoadingDialog('Logging you in...', TImages.loaderAnimation);

      // Check internet
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // Form validation
      if (!loginFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // Save data if Remember Me is selected
      if (rememberMe.value) {
        localStorage.write('REMEMBER_ME_EMAIL', email.text.trim());
        localStorage.write('REMEMBER_ME_PASSWORD', password.text.trim());
      }

      // Login
      final logStatus = await AuthenticationRepository.instance.login(email.text.trim(), password.text.trim());
      var token = await storage.read(key: 'access_token');

      // Remove loader
      TFullScreenLoader.stopLoading();

      // Redirect
      if (token != null) {
        Get.offAll(() => const NavigationMenu());
      } else {
        TLoaders.errorSnackBar(title: 'Error', message: logStatus);
      }
    } catch(e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Something wrong', message: e.toString());
    }

  }
}