import 'package:e_store/common/widgets/loader/animation_loader.dart';
import 'package:e_store/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/colors.dart';

/// A utility class for manging a full-screen loading dialog.
class TFullScreenLoader {
  /// Open a full-screen loading dialog with a given text and animation
  /// This method doesn't return anything
  ///
  /// Parameters:
  ///   - text: The text to be displayed in the loading dialog
  ///   - animation: The Lottie animation to be shown
  static void openLoadingDialog(String text, String animation) {
    showDialog(
      context: Get.overlayContext!,
      barrierDismissible: false,
      builder: (_) => PopScope(
        canPop: false, // Disable popping with the back button
        child: Container(
          color: THelperFunctions.isDarkMode(Get.context!)
              ? TColors.dark
              : TColors.white,
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              const SizedBox(height: 250), // Adjust the spacing as needed
              TAnimationLoaderWidget(text: text, animation: animation),
            ],
          ),
        ),
      ),
    );
  }

  /// Stop the currently open loading dialog
  static stopLoading() {
    Navigator.of(Get.overlayContext!).pop(); // Close the dialog using the Navigator
  }
}
