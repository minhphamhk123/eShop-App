import 'package:e_store/common/widgets.login_signup/form_divider.dart';
import 'package:e_store/common/widgets.login_signup/social_button.dart';
import 'package:e_store/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../../../utils/constants/sizes.dart';
import 'widgets/signup_form.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Title
              Text(TTexts.signupTitle, style: Theme.of(context).textTheme.headlineMedium),
              const SizedBox(height: TSizes.spaceBtwSections),
              
              /// Form
              const TSignupForm(),

              /// Divider
              TFormDivider(dividerText: TTexts.orSignUpWith.capitalize!),

              /// Social Buttons
              const TSocialButtons(),
            ],
          ),
        ),
      ),
    );
  }
}


