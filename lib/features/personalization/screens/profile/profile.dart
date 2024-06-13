import 'package:e_store/common/widgets/appbar/appbar.dart';
import 'package:e_store/common/widgets/images/t_circular_image.dart';
import 'package:e_store/common/widgets/shimmers/shimmer.dart';
import 'package:e_store/features/personalization/screens/profile/widgets/change_name.dart';
import 'package:e_store/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:e_store/common/widgets/texts/section_heading.dart';
import 'package:e_store/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/sizes.dart';
import '../../controllers/user_controller.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      appBar: const TAppBar(
        showBackArrow: true,
        title: Text('Profile'),
      ),

      ///Body
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    Obx(
                    () {
                      final networkImage = controller.user.value.profilePicture;
                      final image = networkImage.isNotEmpty ? networkImage : TImages.user;

                      return controller.imageLoading.value ? const TShimmerEffect(width: 80, height: 80, radius: 80,) : TCircularImage(
                      image: image,
                      width: 80,
                      height: 80,
                        isNetworkImage: networkImage.isNotEmpty,
                    );}
                    ),
                    TextButton(
                        onPressed: () => controller.uploadProfilePicture(),
                        child: const Text('Change Profile Picture')),
                  ],
                ),
              ),

              ///Details
              const SizedBox(height: TSizes.spaceBtwItems / 2,),
              const Divider(),
              const SizedBox(height: TSizes.spaceBtwItems,),
              /// Profile info
              const TSectionHeading(title: 'Profile information', showActionButton: false,),
              const SizedBox(height: TSizes.spaceBtwItems,),

              TProfileMenu(onPressed: () => Get.to(()=>const ChangeName()), title: 'Name', value: controller.user.value.fullName),
              TProfileMenu(onPressed: (){}, title: 'Username', value: controller.user.value.username),

              const SizedBox(height: TSizes.spaceBtwItems,),
              const Divider(),
              const SizedBox(height: TSizes.spaceBtwItems,),

              /// Personal info
              const TSectionHeading(title: 'Personal information', showActionButton: false,),
              const SizedBox(height: TSizes.spaceBtwItems,),

              TProfileMenu(onPressed: (){}, title: 'User ID', value: controller.user.value.id, icon: Iconsax.copy,),
              TProfileMenu(onPressed: (){}, title: 'E-mail', value: controller.user.value.email),
              TProfileMenu(onPressed: (){}, title: 'Phone number', value: controller.user.value.phoneNumber),
              TProfileMenu(onPressed: (){}, title: 'Gender', value: 'Male'),
              TProfileMenu(onPressed: (){}, title: 'Date of birth', value: '22/02/1999'),
              const Divider(),
              const SizedBox(height: TSizes.spaceBtwItems,),
              
              Center(
                child: TextButton(onPressed: () => controller.deleteAccountWarningPopup(),
                  child: const Text('Delete Account', style: TextStyle(color: Colors.red),),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
