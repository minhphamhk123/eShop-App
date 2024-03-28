import 'package:e_store/features/authentication/controllers.onboarding/onboarding_controller.dart';
import 'package:e_store/features/authentication/screens/onboarding/widgets/onboarding_dot_navigation.dart';
import 'package:e_store/features/authentication/screens/onboarding/widgets/onboarding_next_button.dart';
import 'package:e_store/features/authentication/screens/onboarding/widgets/onboarding_page.dart';
import 'package:e_store/features/authentication/screens/onboarding/widgets/onboarding_skip.dart';
import 'package:e_store/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/constants/image_strings.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());
    return Scaffold(
        body: Stack(
          children: [
            /// Horizontal Scrollable Pages
            PageView(
              controller: controller.pageController,
              children: const [
                OnBoardingPage(image: TImages.facebook,
                  title: TTexts.onBoardingTitle1,
                  subTitle: TTexts.onBoardingSubTitle1,),
                OnBoardingPage(image: TImages.facebook,
                  title: TTexts.onBoardingTitle2,
                  subTitle: TTexts.onBoardingSubTitle2,),
                OnBoardingPage(image: TImages.facebook,
                  title: TTexts.onBoardingTitle3,
                  subTitle: TTexts.onBoardingSubTitle3,),
              ],
            ),

            ///Skip Button
            const OnBoardingSkip(),

            ///Dot Navigation SmoothPageIndicator
            const OnBoardingDotNavigation(),

            ///Circular Button
            const OnBoardingNextButton()

          ],
        )
    );
  }
}
