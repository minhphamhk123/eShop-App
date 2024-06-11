import 'package:e_store/data/repositories/authentication/authentication_repository.dart';
import 'package:e_store/data/repositories/user/user_repository.dart';
import 'package:e_store/features/authentication/screens/login/login.dart';
import 'package:e_store/features/personalization/models/user_model.dart';
import 'package:e_store/features/personalization/screens/profile/widgets/re_authenticate_user_login_form.dart';
import 'package:e_store/utils/constants/image_strings.dart';
import 'package:e_store/utils/popups/full_screen_loader.dart';
import 'package:e_store/utils/popups/loaders.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../data/network_manager.dart';
import '../../../utils/constants/sizes.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  final profileLoading = false.obs;
  Rx<UserModel> user = UserModel.empty()
      .obs; //obs giup moi khi co thay doi voi user thi ta se redraw lai trang

  final hidePassword = false.obs;
  final verifyEmail = TextEditingController();
  final verifyPassword = TextEditingController();
  final userRepository = Get.put(UserRepository());
  GlobalKey<FormState> reAuthFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
    fetchUserRecord();
  }

  Future<void> fetchUserRecord() async {
    try {
      profileLoading.value = true;
      final user = await userRepository.fetchUserDetails();
      this.user(user);
    } catch (e) {
      user(UserModel.empty());
    } finally {
      profileLoading.value = false;
    }
  }

  /// Delete Account Warning
  void deleteAccountWarningPopup() {
    Get.defaultDialog(
      contentPadding: const EdgeInsets.all(TSizes.md),
      title: 'Delete Account',
      middleText:
          'Are you sure you want to delete your account permanently? This action is not reversible and all of your data be removed permanently.',
      confirm: ElevatedButton(
        onPressed: () async => deleteUserAccount(),
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
            side: const BorderSide(color: Colors.red)),
        child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: TSizes.lg),
            child: Text('Delete')),
      ),
      cancel: ElevatedButton(
        onPressed: () => Navigator.of(Get.overlayContext!).pop(),
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: TSizes.lg),
          child: Text('Cancel'),
        ),
      ),
    );
  }

  /// Delete User Account
  void deleteUserAccount() async {
    try {
      TFullScreenLoader.openLoadingDialog('Processing', TImages.loaderAnimation);
      final auth = AuthenticationRepository.instance;

      TFullScreenLoader.stopLoading();
      Get.to(() => const ReAuthLoginForm());
    }
    catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.warningSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  Future<void> reAuthenticationEmailAndPasswordUser() async {
    try {
      // Start Loading
      TFullScreenLoader.openLoadingDialog(
          'Processing...', TImages.loaderAnimation);

      // Check Internet Connect
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        // Remove Loader
        TFullScreenLoader.stopLoading();
        return;
      }

      // Form Validation
      if (!reAuthFormKey.currentState!.validate()) {
        // Remove Loader
        TFullScreenLoader.stopLoading();
        return;
      }

      final delete = await UserRepository.instance.deleteUserDetails(verifyEmail.text.trim(), verifyPassword.text.trim());

      TFullScreenLoader.stopLoading();

      if(delete  != '') {
        Navigator.of(Get.overlayContext!).pop();
        TLoaders.errorSnackBar(title: 'Problem wwith delete account', message: delete);
      } else {
        Get.offAll(() => const LoginScreen());
      }
    } catch(e) {
      TFullScreenLoader.stopLoading();
      TLoaders.warningSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
 }
