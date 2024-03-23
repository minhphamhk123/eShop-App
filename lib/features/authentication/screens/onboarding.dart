import 'package:e_store/utils/constants/image_strings.dart';
import 'package:e_store/utils/constants/text_strings.dart';
import 'package:e_store/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          /// Horizontal Scrollable Pages
          PageView(
            children: [
              Column(
                children: [
                  Image(
                      width: THelperFunctions.screenWidth() * 0.8,
                      height: THelperFunctions.screenHeight() * 0.6,
                      image: AssetImage(TImages.facebook)),
                  Text(
                    TTexts.onBoardingTitle1,
                    style: Theme.of(context).textTheme.headlineMedium,
                    textAlign: TextAlign.center,
                  ),

                  Text(
                    TTexts.onBoardingTitle1,
                    style: Theme.of(context).textTheme.headlineMedium,
                    textAlign: TextAlign.center,
                  ),
                ],
              )
            ],
          )

          /// Skip Button

          /// Dot Navigation SmoothPageIndicator

          /// Circular Button
        ],
      ),
    );
  }
}
