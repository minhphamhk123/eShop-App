import 'dart:async';

import 'package:e_store/common/widgets/success_screen/success_screen.dart';
import 'package:e_store/data/repositories/authentication/authentication_repository.dart';
import 'package:e_store/features/authentication/controllers/signup/signup_controller.dart';
import 'package:e_store/utils/constants/image_strings.dart';
import 'package:e_store/utils/constants/text_strings.dart';
import 'package:e_store/utils/popups/loaders.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../socket_service.dart';
import '../../../personalization/models/user_model.dart';

class VerifyEmailController extends GetxController {
  static VerifyEmailController get instance => Get.find();

  // Lấy instance của SignupController
  final SocketService _socketService = SocketService();
  Timer? _timer; // Timer để kiểm tra trạng thái tự động
  final deviceStorage = GetStorage();
  var emailCheck = ''.obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    print("$emailCheck in email verify controller");
    // Theo dõi sự thay đổi của email
    ever(emailCheck, (String? emailCheck) {
      if (emailCheck != null && emailCheck.isNotEmpty) {
        _socketService.connect(emailCheck);
        _startAutoCheck();
      }
    });
  }

  @override
  void dispose() {
    _socketService.disconnect();
    _timer?.cancel(); // Hủy timer khi controller bị dispose
    super.dispose();
  }

  /// Send email verification
  sendEmailVerification(String email) async {

    try {
      await AuthenticationRepository.instance.sendEmail(email);
      TLoaders.successSnackBar(title: 'Email sent', message: 'Please check your email, maybe check in spam section');
    } catch(e) {
      print(e);
      TLoaders.errorSnackBar(title: 'Something wrong', message: e.toString());
    }
  }

  /// Check if email verified manual
  Future<void> checkButton() async {
    print(_socketService.verifyStatus.value);
    if (_socketService.verifyStatus.value == 'pending' ||
        _socketService.verifyStatus.value == 'false') {
      TLoaders.successSnackBar(title: 'Please verify your email');
    } else if (_socketService.verifyStatus.value == 'true') {
      _socketService.disconnect();
      await deviceStorage.writeIfNull('IsVerify', true);
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

  /// Bắt đầu kiểm tra trạng thái tự động mỗi 5 giây
  void _startAutoCheck() {
    _timer = Timer.periodic(Duration(seconds: 5), (timer) async {
      print(_socketService.verifyStatus.value);
      if (_socketService.verifyStatus.value == 'true') {
        _socketService.disconnect();
        _timer?.cancel();
        await deviceStorage.writeIfNull('IsVerify', true);
        Get.off(
              () => SuccessScreen(
            image: TImages.loaderAnimation,
            title: TTexts.yourAccountCreatedTitle,
            subTitle: TTexts.yourAccountCreatedSubTitle,
            onPressed: () => AuthenticationRepository.instance.screenRedirect(),
          ),
        );
      }
    });
  }

}
