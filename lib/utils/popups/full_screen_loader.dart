import 'package:e_store/common/widgets/loaders/animation_loader.dart';
import 'package:e_store/utils/constants/colors.dart';
import 'package:e_store/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TFullScreenLoader {
  static void openLoadingDialog(String text, String animation) {
    showDialog(
      context: Get.overlayContext!,
      barrierDismissible: false,
      builder: (_) => PopScope(
          canPop: false,
          child: Container(
            color: THelperFunctions.isDarkMode(Get.context!)
                ? TColors.dark
                : TColors.white,
            width: double.infinity,
            height: double.infinity,
            child: ListView(
              children: [
                const SizedBox(height: 50),
                TAnimationLoaderWidget(text: text, animation: animation),
              ],
            ),
          )),
    );
  }

  ///Stop the currently open loading dialog.
  static stopLoading() {
    Navigator.of(Get.overlayContext!).pop();
  }
}
