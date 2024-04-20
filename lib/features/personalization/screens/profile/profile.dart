import 'package:e_store/common/widgets/appbar/appbar.dart';
import 'package:e_store/common/widgets/images/t_circular_image.dart';
import 'package:e_store/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:e_store/section_heading.dart';
import 'package:e_store/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/sizes.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                    const TCircularImage(
                      image: TImages.user,
                      width: 80,
                      height: 80,
                    ),
                    TextButton(
                        onPressed: (){},
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

              TProfileMenu(onPressed: (){}, title: 'Name', value: 'Minh'),
              TProfileMenu(onPressed: (){}, title: 'Username', value: 'minhpham'),

              const SizedBox(height: TSizes.spaceBtwItems,),
              const Divider(),
              const SizedBox(height: TSizes.spaceBtwItems,),

              /// Personal info
              const TSectionHeading(title: 'Personal information', showActionButton: false,),
              const SizedBox(height: TSizes.spaceBtwItems,),

              TProfileMenu(onPressed: (){}, title: 'User ID', value: '2ry5478', icon: Iconsax.copy,),
              TProfileMenu(onPressed: (){}, title: 'E-mail', value: 'a@gmail.com'),
              TProfileMenu(onPressed: (){}, title: 'Phone number', value: '000000000'),
              TProfileMenu(onPressed: (){}, title: 'Gender', value: 'Male'),
              TProfileMenu(onPressed: (){}, title: 'Date of birth', value: '22/02/1999'),
              const Divider(),
              const SizedBox(height: TSizes.spaceBtwItems,),
              
              Center(
                child: TextButton(onPressed: () {  },
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
