import 'package:e_store/common/widgets/images/t_circular_image.dart';
import 'package:e_store/utils/constants/colors.dart';
import 'package:e_store/utils/constants/image_strings.dart';
import 'package:e_store/utils/constants/sizes.dart';
import 'package:e_store/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class TVerticalImageText extends StatelessWidget{
  const TVerticalImageText({
    super.key,
    required this.image,
    required this.title,
    this.textColor = TColors.white,
    this.backgroundColor = TColors.white,
    this.onTap, this.isNetworkImage = true,
  });

  final String image,title;
  final Color textColor;
  final Color? backgroundColor;
  final bool isNetworkImage;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context)
  {
    //final dark = THelperFunctions.isDarkode(context);

    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: TSizes.spaceBtwItems),
        child: Column(
          children:[

            TCircularImage(
              image: image,
              fit: BoxFit.fitWidth,
              padding: TSizes.sm * 1.4,
              isNetworkImage: isNetworkImage,
              backgroundColor: backgroundColor,
              overlayColor: THelperFunctions.isDarkMode(context) ? TColors.light : TColors.dark,
            ),
            // Container(
            //   width: 56,
            //   height: 56,
            //   padding: const EdgeInsets.all(TSizes.sm),
            //   decoration: BoxDecoration(
            //     color: backgroundColor,
            //     borderRadius: BorderRadius.circular(100)
            //   ),
            //   child: Center(
            //     child: Image(image: AssetImage(image),fit: BoxFit.cover, color: TColors.black)
            //     ),
            // ),

            //Text
            const SizedBox(height: TSizes.spaceBtwItems/2),
            SizedBox(
              width: 55,
              child: Text(title,style: Theme.of(context).textTheme.labelMedium!.apply(color: TColors.white), maxLines: 1,overflow: TextOverflow.ellipsis,
              ),
            )
          ],
        ),
      ),
    );
  }
}