import 'package:e_store/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../utils/constants/sizes.dart';
import '../../../utils/device/device_utility.dart';

class TSearchContainer extends StatelessWidget{
  const TSearchContainer({
    super.key,
    required this.text, this.icon = Iconsax.search_normal, this.showBackground = true, this.showBorder = true 
  });

  final String text;
  final IconData? icon;
  final bool showBackground, showBorder;

  @override
  Widget build(BuildContext context)
  {
    //final dark = THelperFunctions.isDarkmode(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
      child: Container(
        width: TDeviceUtils.getScreenWidth(context),
        padding: const EdgeInsets.all(TSizes.md),
        decoration: BoxDecoration(
          color: TColors.light,
          borderRadius: BorderRadius.circular(TSizes.cardRadiusLg),
          border: showBorder ? Border.all(color: Colors.grey):null
          ),
          child: Row(
            children: [
              Icon(icon, color: Colors.grey),
              const SizedBox(width: TSizes.spaceBtwItems),
              Text(text /*, style:*/),

            ],
          ),
      ),

    );
  }
}