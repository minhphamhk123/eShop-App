import 'package:e_store/features/authentication/screens/login/widgets/login_form.dart';
import 'package:e_store/features/authentication/screens/login/widgets/login_header.dart';
import 'package:e_store/utils/constants/sizes.dart';
import 'package:e_store/common/styles/spacing_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../common/widgets/login_signup/form_divider.dart';
import '../../../../common/widgets/login_signup/social_button.dart';
import '../../../../utils/constants/text_strings.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
         padding: TSpacingStyle.paddingWithAppBarHeight,
         child: Column(
           children: [
             ///Logo, Title & Sub-Title
             const TLoginHeader(),

             /// Form
             const TLoginForm(),

             /// Divider
             TFormDivider(dividerText: TTexts.orSignInWith.capitalize!),
             const SizedBox(width: TSizes.spaceBtwSections),

             /// Footer
             const TSocialButtons()
           ],
         ),
       ),
     ),
   );
  }
}







