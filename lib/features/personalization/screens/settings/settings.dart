import 'package:e_store/common/widgets/list_tiles/settings_menu_tile.dart';
import 'package:e_store/features/shop/screens/order/order.dart';
import 'package:e_store/features/personalization/screens/address/address.dart';
import 'package:e_store/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/custom_shapes/containers/primary_header_container.dart';
import '../../../../common/widgets/list_tiles/user_profile_tile.dart';
import '../../../../section_heading.dart';
import '../../../../utils/constants/colors.dart';
import '../profile/profile.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Column(
      children: [
        ///header
        TPrimaryHeaderContainer(
          child: Column(
            children: [
              ///Appbar
              TAppBar(
                  title: Text('Account',
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium!
                          .apply(color: TColors.white))),
              const SizedBox(height: TSizes.spaceBtwSections),

              ///User Profile Card
              TUserProfileTile(
                  onPressed: () => Get.to(() => const ProfileScreen())),
              const SizedBox(height: TSizes.spaceBtwSections),
            ],
          ),
        ),

        ///body
        Padding(
            padding: const EdgeInsets.all(TSizes.defaultSpace),
            child: Column(
              children: [
                ///Account Settings
                const TSectionHeading(
                  title: 'Account Settings',
                  showActionButton: false,
                ),
                const SizedBox(height: TSizes.spaceBtwItems),

                TSettingsMenuTile(
                    icon: Iconsax.icon,
                    title: 'My Address',
                    subTitle: 'Set shopping delivery address'),
                TSettingsMenuTile(
                    icon: Iconsax.shopping_cart,
                    title: 'My Cart',
                    subTitle: 'Add, remove products and move to checkout'),
                TSettingsMenuTile(
                    icon: Iconsax.bag_tick,
                    title: 'My Orders',
                    subTitle: 'In-progress and Completed Orders',
                    onTap: () => Get.to(() => const OrderScreen())),
                TSettingsMenuTile(
                    icon: Iconsax.bank,
                    title: 'Bank Account',
                    subTitle: 'Withdraw balance to registered bank accounts'),
                TSettingsMenuTile(
                    icon: Iconsax.discount_shape,
                    title: 'My Coupons',
                    subTitle: 'List of all the discounted coupons'),
                TSettingsMenuTile(
                    icon: Iconsax.notification,
                    title: 'Notifications',
                    subTitle: 'Set any kind of notification messages'),
                TSettingsMenuTile(
                    icon: Iconsax.security_card,
                    title: 'Account Privacy',
                    subTitle: 'Manage data usage and connect accounts'),

                ///App Settings
                const SizedBox(height: TSizes.spaceBtwSections),
                const TSectionHeading(
                    title: 'App Settings', showActionButton: false),
                const SizedBox(height: TSizes.spaceBtwSections),
                const TSettingsMenuTile(
                    icon: Iconsax.document_upload,
                    title: 'Load Data',
                    subTitle: 'Upload data to Cloud Firebase'),
                TSettingsMenuTile(
                  icon: Iconsax.location,
                  title: 'Geolocation',
                  subTitle: 'Set recommendation based on location',
                  trailing: Switch(value: true, onChanged: (value) {}),
                ),
                TSettingsMenuTile(
                  icon: Iconsax.security_user,
                  title: 'Safe Mode',
                  subTitle: 'Search result is safe for all ages',
                  trailing: Switch(value: false, onChanged: (value) {}),
                ),
                TSettingsMenuTile(
                  icon: Iconsax.image,
                  title: 'HD Image Quality',
                  subTitle: 'Set image quality to be seen',
                  trailing: Switch(value: false, onChanged: (value) {}),
                ),

                ///Logout Button
                SizedBox(height: TSizes.spaceBtwSections),
                SizedBox(
                  width: double.infinity,
                  child:
                      OutlinedButton(onPressed: () {}, child: Text('Logout')),
                ),
                SizedBox(height: TSizes.spaceBtwSections * 2.5),
              ],
            ))
      ],
    )));
  }
}
