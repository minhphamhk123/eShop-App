import 'package:e_store/common/widgets/success_screen/success_screen.dart';
import 'package:e_store/data/repositories/authentication/authentication_repository.dart';
import 'package:e_store/features/authentication/controllers/signup/verify_email_controller.dart';
import 'package:e_store/features/authentication/screens/login/login.dart';
import 'package:e_store/utils/helpers/helper_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/text_strings.dart';

class VerifyScreen extends StatelessWidget {
  const VerifyScreen({super.key, this.email});

  final String? email;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VerifyEmailController());
    controller.emailCheck.value = email!;
    
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [IconButton(onPressed: () => Get.offAll(() => AuthenticationRepository.instance.logout()), icon: const Icon(CupertinoIcons.clear)),],
      ),
      body: SingleChildScrollView(
        // Padding to Give Default Equal Space on all sides in all screens.
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              /// Image
              Image(
                image: const AssetImage(TImages.deliveredEmailIllustration),
                width: THelperFunctions.screenWidth() * 0.6,
              ),
              const SizedBox(height: TSizes.spaceBtwSections),

              /// Title & SubTitle
              Text(TTexts.confirmEmail, style: Theme.of(context).textTheme.headlineMedium, textAlign: TextAlign.center,),
              const SizedBox(height: TSizes.spaceBtwItems,),
              Text(email ?? '', style: Theme.of(context).textTheme.labelLarge, textAlign: TextAlign.center),
              const SizedBox(height: TSizes.spaceBtwItems,),
              Text(TTexts.confirmEmailSubTitle, style: Theme.of(context).textTheme.labelMedium, textAlign: TextAlign.center),
              const SizedBox(height: TSizes.spaceBtwSections,),

              /// Buttons
              SizedBox(
                  width: double.infinity, 
                  child: ElevatedButton(
                      onPressed: () => controller.checkButton(),
                      child: const Text(TTexts.tContinue))),
              const SizedBox(height: TSizes.spaceBtwItems,),
              SizedBox(width: double.infinity, child: TextButton(onPressed: () => controller.sendEmailVerification(email!), child: const Text(TTexts.resendEmail))),
            ],
          ),
        ),
      )
    );
  }
}
