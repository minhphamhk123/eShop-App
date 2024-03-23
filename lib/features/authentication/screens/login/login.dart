import 'dart:js';
import 'dart:js_interop';

import 'package:e_store/common/styles/spacing_styles.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunction.IsDarkMode(context);
    return const Scaffold(
      body: SingleChildScrollView(
        child: Padding(
         padding: TSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [
              /// Logo,Title & Sub-Title
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image(
                    height: 150,
                    image: AssetImage(dark ? TImages.lightAppLogo : TImages.darkAppLogo),
              ),
                  Text(TTexts.loginTitle, style: Theme.of(context).textTheme.headlineMedium),
                  const SizedBox(height: TSizes.sm),
                  Text(TTexts.loginSubTitle, style: Theme.of(context).textTheme.bodyMedium),
            ],
          ),
        ),
      )
    );
  }
}
