import 'package:e_store/common/widgets/success_screen/success_screen.dart';
import 'package:e_store/data/repositories/authentication/authentication_repository.dart';
import 'package:e_store/features/authentication/controllers/signup/signup_controller.dart';
import 'package:e_store/utils/constants/image_strings.dart';
import 'package:e_store/utils/constants/text_strings.dart';
import 'package:e_store/utils/popups/loaders.dart';
import 'package:get/get.dart';

import '../../../../socket_service.dart';

class VerifyEmailController extends GetxController {
  static VerifyEmailController get instance => Get.find();

  // Lấy instance của SignupController
  final SignupController signupController = SignupController.instance;
  final SocketService _socketService = SocketService();

  @override
  void onInit() {
    super.onInit();
    final user = signupController.user.value;
    print("${user?.id} in email verify controller");
    _socketService.connect(user!.id);
  }

  @override
  void dispose() {
    _socketService.disconnect();
    super.dispose();
  }

  /// Check if email verified
  checkButton() {
    print(_socketService.verifyStatus.value);
    if (_socketService.verifyStatus.value == 'pending' ||
        _socketService.verifyStatus.value == 'false') {
      TLoaders.successSnackBar(title: 'Please verify your email');
    } else if (_socketService.verifyStatus.value == 'true') {
      Get.off(
        () => SuccessScreen(
          image: TImages.loaderAnimation,
          title: TTexts.yourAccountCreatedTitle,
          subTitle: TTexts.yourAccountCreatedSubTitle,
          onPressed: () => AuthenticationRepository.instance.screenRedirect(),
        ),
      );
    }
    else {
      TLoaders.errorSnackBar(title: 'Something wrong');
    }
  }
}
