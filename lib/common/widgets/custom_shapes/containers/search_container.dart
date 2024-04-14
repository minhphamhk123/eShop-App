import 'package:e_store/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/sizes.dart';
import '../../../../utils/device/device_utility.dart';
import '../../../../utils/helpers/helper_functions.dart';

class TSearchContainer extends StatelessWidget {
  const TSearchContainer(
      {super.key, required
        this.text,
        this.icon = Iconsax.search_normal,
        this.showBackground = true,
        this.showBorder = true,
        this.padding = const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace)
      });

  final String text;
  final IconData? icon;
  final bool showBackground, showBorder;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return Padding(
      padding: padding,
      child: Container(
        width: TDeviceUtils.getScreenWidth(context),
        padding: const EdgeInsets.all(TSizes.md),
        decoration: BoxDecoration(
            color: TColors.light,
            borderRadius: BorderRadius.circular(TSizes.cardRadiusLg),
            border: showBorder ? Border.all(color: Colors.grey) : null),
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
