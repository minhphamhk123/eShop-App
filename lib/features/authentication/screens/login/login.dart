

import 'package:e_store/utils/constants/sizes.dart';
import 'package:e_store/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:e_store/common/styles/spacing_styles.dart';
import 'package:e_store/utils/constants/image_strings.dart';
import 'package:e_store/utils/helpers/helper_functions.dart';
import 'package:iconsax/iconsax.dart';


class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
         padding: TSpacingStyle.paddingWithAppBarHeight,
         child: Column(
           children: [
             ///Logo, Title & Sub-Title
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
             /// Form
             Form(child: Column(
               children: [
                 ///Email
                 TextFormField(
                   decoration: InputDecoration(
                     prefixIcon: Icon(Iconsax.direct_right),
                     labelText: TTexts.onBoardingTitle3,
                   ),
                 )
                 ///Password
               ],
             ))
           ],
         ),
       ),
     ),
   );
  }
}
