import 'dart:ui';

import 'package:e_store/common/widgets/texts/t_brand_title_text_with_verified_icon.dart';
import 'package:e_store/features/shop/controllers/product/product_controller.dart';
import 'package:e_store/features/shop/models/product_model.dart';
import 'package:e_store/features/shop/screens/product_details/product_detail.dart';
import 'package:e_store/utils/constants/colors.dart';
import 'package:e_store/utils/helpers/helper_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../rounded_container.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../styles/shadows.dart';
import '../../icons/t_circular_icon.dart';
import '../../images/t_rounded_image.dart';
import '../../texts/product_price_text.dart';
import '../../texts/product_title_text.dart';

class TProductCardVertical extends StatelessWidget {
  const TProductCardVertical({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    final controller = ProductController.instance;
    return GestureDetector(
        onTap: () => Get.to(() => ProductDetailScreen(product: product,)),
        child: Container(
          padding: const EdgeInsets.all(1),
          decoration: BoxDecoration(
            boxShadow: [TShadowStyle.verticalProductShadow],
            borderRadius: BorderRadius.circular(TSizes.productImageRadius),
            color: dark ? TColors.darkerGrey : TColors.white,
          ),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                /// Thumbnail, WishList Button, Discount Tag
                TRoundedContainer(
                  height: 180,
                  padding: const EdgeInsets.all(TSizes.sm),
                  backgroundColor: dark ? TColors.dark : TColors.light,
                  child: Stack(
                    children: [

                      Center(
                        child: TRoundedImage(
                          imageUrl: product.thumbnail,
                          applyImageRadius: true,
                          isNetworkImage: true,
                        ),
                      ),

                      /// -- Sale Tag
                      Positioned(
                        top: 12,
                        child: TRoundedContainer(
                          radius: TSizes.sm,
                          backgroundColor: TColors.secondary.withOpacity(0.8),
                          padding: const EdgeInsets.symmetric(
                              horizontal: TSizes.sm, vertical: TSizes.xs),
                          child: Text(
                            '${product.discountPercentage}%',
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge
                                ?.apply(color: TColors.black),
                          ),
                        ),
                      ),

                      /// -- Favourite Icon Button
                      const Positioned(
                          top: 0,
                          right: 0,
                          child: TCircularIcon(
                            icon: Iconsax.heart,
                            color: Colors.red,
                          ))
                    ],
                  ),
                ),
                const SizedBox(height: TSizes.spaceBtwItems / 2),

                /// -- Details
                Padding(
                  padding: const EdgeInsets.only(left: TSizes.sm),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TProductTitleText(
                          title: product.title,
                          smallSize: true,
                        ),
                        const SizedBox(
                          height: TSizes.spaceBtwItems / 2,
                        ),
                        Row(
                          children: [
                            Text(
                              product.brand,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: Theme.of(context).textTheme.labelMedium,
                            ),
                            const SizedBox(
                              width: TSizes.xs,
                            ),
                            const Icon(
                              Iconsax.verify5,
                              color: TColors.primary,
                              size: TSizes.iconXs,
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ///Price
                            Padding(
                              padding: const EdgeInsets.only(left: TSizes.sm),
                              child: TProductPriceText(
                                price: product.price.toString(),
                              ),
                            ),

                            ///Add to cart
                            Container(
                              decoration: const BoxDecoration(
                                  color: TColors.dark,
                                  borderRadius: BorderRadius.only(
                                      topLeft:
                                          Radius.circular(TSizes.cardRadiusMd),
                                      bottomRight: Radius.circular(
                                          TSizes.productImageRadius))),
                              child: const SizedBox(
                                  width: TSizes.iconLg * 1.2,
                                  height: TSizes.iconLg * 1.2,
                                  child: Center(
                                      child: Icon(Iconsax.add,
                                          color: TColors.white))),
                            ),
                          ],
                        ),
                      ]),
                ),
              ]),
        ));
  }
}
