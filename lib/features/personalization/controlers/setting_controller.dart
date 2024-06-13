import 'package:get/get.dart';

import '../../../data/repositories/authentication/authentication_repository.dart';

class SettingController extends GetxController {
  static SettingController get instance => Get.find();

  /// Variables



  logout() async {
    try {
      await AuthenticationRepository.instance.logout();
    } catch(e) {
      throw e;
    }

  }
}