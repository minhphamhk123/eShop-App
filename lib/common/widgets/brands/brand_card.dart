import 'package:flutter/material.dart';

import '../../../rounded_container.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';
import '../images/t_circular_image.dart';

class TBrandCard extends StatelessWidget {
  const TBrandCard({
    super.key,
    this.onTap,
    required this.showBorder,
  });

  final bool showBorder;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: TRoundedContainer(
          padding: const EdgeInsets.all(TSizes.sm),
          showBorder: showBorder,
          backgroundColor: Colors.transparent,
          child: Row(
            children: [
              /// -- Icon
              Flexible(
                child: TCircularImage(
                  isNetworkImage: false,
                  image: TImages.clothIcon,
                  backgroundColor: Colors.transparent,
                  overlayColor: isDark ? TColors.white : TColors.black,
                ),
              ),
              const SizedBox(width: TSizes.spaceBtwItems / 2),

              /// -- Text
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // const TBrandTitleWithVerifiedIcon(title: 'Nike', brandTextSize: TextSizes.large),
                    Text(
                      '256 products',
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.labelMedium,
                    )
                  ],
                ),
              )
            ],
          )),
    );
  }
}
