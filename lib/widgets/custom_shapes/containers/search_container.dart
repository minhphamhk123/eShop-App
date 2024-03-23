import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

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
        width: TDeviceUnits.getScreenWidth(context);
        padding: const EdgeInsets.all(TSizes.md);
        decortaion: BoxDecoration(
          color: Colors.light,
          borderRadius: BorderRadius.circular(TSizes.cardRadiusLg),
          border: showBorder ? Border.all(color: Colors.grey):null
          ),
          child: Row(
            children: [
              Icon(icon, color: Colors.grey)
              const SizedBox(width: TSizes.spaceBtwItems),
              Text(text /*, style:*/),

            ],
          ),
      ),

    );
  }
}