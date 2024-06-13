import 'package:e_store/common/widgets/icons/t_circular_icon.dart';
import 'package:e_store/common/widgets/images/t_rounded_image.dart';
import 'package:e_store/common/widgets/texts/product_price_text.dart';
import 'package:e_store/common/widgets/texts/product_title_text.dart';
import 'package:e_store/features/shop/controllers/product/product_controller.dart';
import 'package:e_store/features/shop/models/product_model.dart';
import 'package:e_store/rounded_container.dart';
import 'package:e_store/utils/constants/image_strings.dart';
import 'package:e_store/utils/helpers/helper_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'dart:ui';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';

class TProductCardHorizontal extends StatelessWidget{
  const TProductCardHorizontal({super.key, required this.product});
final ProductModel product;
  @override
  Widget build(BuildContext context)
  {
    final dark = THelperFunctions.isDarkMode(context);
    final controller = ProductController.instance;

    return Container(
        width: 310,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(TSizes.productImageRadius),
          color: dark ? TColors.darkerGrey : TColors.lightContainer,
        ),
        child: Row(
          children: [
            ///Thumbnail
            TRoundedContainer(
              height: 120,
              padding: const EdgeInsets.all(TSizes.sm),
              backgroundColor: dark ? TColors.darkerGrey : TColors.white,
              child: Stack(
                children: [
                  ///Thumbnail Image
                  SizedBox(
                    height: 120,
                    width: 120,
                    child: TRoundedImage(imageUrl: product.thumbnail, isNetworkImage: true, applyImageRadius: true,),
                  ),
                  ///Sale tag
                  Positioned(
                    top: 12,
                    child: TRoundedContainer(
                      radius: TSizes.sm,
                      backgroundColor: TColors.secondary, //withOpacity(0.8)
                      padding: const EdgeInsets.symmetric(
                          horizontal: TSizes.sm, vertical: TSizes.xs),
                      child: Text(
                        '${product.discountPercentage}%',
                        //style: Theme.of(context).textTheme.labelLarge!.apply(color: TColors.black),
                      ),
                    ),
                  ),
                  ///Favorite Icon Button
                  Positioned(
                    top: 0,
                    right: 0,
                    child: TCircularIcon(icon: Iconsax.heart5, color: Colors.red),
                  )
                ],
              ),
            ),
            ///Details
            SizedBox(
              width: 172,
              child: Padding(
                padding: EdgeInsets.only(top: TSizes.sm, left: TSizes.sm),
                child: Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TProductTitleText(title: product.title, smallSize: true,),
                        SizedBox(height:TSizes.spaceBtwItems/2),
                        //TBrandTitleWithVerifiedIcon(title: 'Nike'),
                      ],
                    ),
                    const Spacer(),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ///Pricing
                        Flexible(child: TProductPriceText(price: controller.calculateDiscountedPrice(product.price!, product.discountPercentage!))),
                        ///Add to cart
                        Container(
                          decoration: const BoxDecoration(
                              color: TColors.dark,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(TSizes.cardRadiusMd),
                                  bottomRight:
                                  Radius.circular(TSizes.productImageRadius))),
                          child: const SizedBox(
                              width: TSizes.iconLg * 1.2,
                              height: TSizes.iconLg * 1.2,
                              child: Center(child: Icon(Iconsax.add, color: TColors.white))),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        )
    );
  }
}