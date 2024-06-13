import 'package:e_store/features/personalization/controllers/user_controller.dart';
import 'package:get/get.dart';

import '../../../data/repositories/authentication/authentication_repository.dart';

class SettingController extends GetxController {
  static SettingController get instance => Get.find();

  @override
  void onInit() {
    super.onInit();
    fetch();
  }

  /// Variables

  fetch() async {
    await UserController.instance.fetchUserRecord();
  }

  logout() async {
    try {
      await AuthenticationRepository.instance.logout();
    } catch(e) {
      throw e;
    }

  }
}