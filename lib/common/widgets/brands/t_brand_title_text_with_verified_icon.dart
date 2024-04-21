import 'package:e_store/utils/constants/colors.dart';
import 'package:e_store/utils/constants/enums.dart';
import 'package:e_store/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class TBranchTitleWithVerifiedIcon extends StatelessWidget {
  const TBranchTitleWithVerifiedIcon({
    super.key,
    this.textColor,
    this.maxLines = 1,
    required this.title,
    this.iconColor = TColors.primary,
    this.textAlign = TextAlign.center,
    this.brandTextSize = TextSize.small,
  });

  final String title;
  final int maxLines;
  final Color? textColor, iconColor;
  final TextAlign? textAlign;
  final TextSize brandTextSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Flexible(
        //   child: TBrandTitleText(
        //       title: title,
        //       color: textColor,
        //       maxLines: maxLines,
        //       textAlign: textAlign,
        //       brandTextSize: brandTextSize
        //   ),
        // ),
        const SizedBox(width: TSizes.xs),
        Icon(Iconsax.verify5, color: iconColor, size: TSizes.xs),
      ],
    );
  }
}
