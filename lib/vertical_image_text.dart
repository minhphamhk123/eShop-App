import 'package:e_store/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class TVerticalImageText extends StatelessWidget{
  const TVerticalImageText({
    super.key,
    required this.image,
    required this.title,
    this.textColor = Colors.white,
    this.backgroundColor = Colors.white,
    this.onTap,
  });

  final String image,title;
  final Color textColor;
  final Color? backgroundColor;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context)
  {
    //final dark = THelperFunctions.isDarkmode(context);

    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: TSizes.spaceBtwItems),
        child: Column(
          children:[
            Container(
              width: 56,
              height: 56,
              padding: const EdgeInsets.all(TSizes.sm),
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.circular(100)
              ),
              child: Center(
                child: Image(image: AssetImage(image),fit: BoxFit.cover, color: Colors.black)
                ),
            ),

            //Text
            const SizedBox(height: TSizes.spaceBtwItems/2),
            SizedBox(
              width: 55,
              child: Text(title,/*style: ,*/ maxLines: 1,overflow: TextOverflow.ellipsis,
              ),
            )
          ],
        ),
      ),
    );
  }
}