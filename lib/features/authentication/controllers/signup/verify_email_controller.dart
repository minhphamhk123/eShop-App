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

class VerifyEmailController extends GetxController {
  static VerifyEmailController get instance => Get.find();

  // Lấy instance của SignupController
  final SocketService _socketService = SocketService();
  Timer? _timer; // Timer để kiểm tra trạng thái tự động
  final deviceStorage = GetStorage();
  late var user;

  @override
  Future<void> onInit() async {
    super.onInit();
    user = await AuthenticationRepository.instance.getUser();
    print("${user?.id} in email verify controller");
    _socketService.connect(user!.id);

    // Bắt đầu kiểm tra trạng thái tự động mỗi 5 giây
    _startAutoCheck();
  }

  @override
  void dispose() {
    _socketService.disconnect();
    _timer?.cancel(); // Hủy timer khi controller bị dispose
    super.dispose();
  }

  /// Send email verification
  sendEmailVerification() async {
    final user = await AuthenticationRepository.instance.getUser();
    try {
      await AuthenticationRepository.instance.sendEmail(user!.id, user.email);
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
      await AuthenticationRepository.instance.login(user.username, user.password);
      _socketService.disconnect();
      deviceStorage.writeIfNull('IsVerify', true);
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
        await AuthenticationRepository.instance.login(user.username, user.password);
        _socketService.disconnect();
        _timer?.cancel();
        deviceStorage.writeIfNull('IsVerify', true);
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
