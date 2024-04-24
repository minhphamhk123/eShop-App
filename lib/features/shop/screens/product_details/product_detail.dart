import 'package:e_store/features/shop/screens/product_details/widgets/bottom_add_to_cart_widget.dart';
import 'package:e_store/features/shop/screens/product_details/widgets/product_attributes.dart';
import 'package:e_store/features/shop/screens/product_details/widgets/product_detail_image_slider.dart';
import 'package:e_store/features/shop/screens/product_details/widgets/product_meta_data.dart';
import 'package:e_store/features/shop/screens/product_details/widgets/rating_share_%C6%B0idget.dart';
import 'package:e_store/section_heading.dart';
import 'package:e_store/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';

import '../../../../utils/constants/sizes.dart';
import '../porduct_reviews/product_reviews.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      bottomNavigationBar: const TBottomAddToCart(),
        body: SingleChildScrollView(
      child: Column(
        children: [
          /// 1 - Product Image Slider
          const TProductImageSlider(),

          /// 2 - Product Details
          Padding(
            padding: const EdgeInsets.only(
                right: TSizes.defaultSpace,
                left: TSizes.defaultSpace,
                bottom: TSizes.defaultSpace),
            child: Column(
              children: [
                /// Rating & share button
                TRatingAndShare(),

                /// Price, Title, Stock & Brand
                TProductMetaData(),

                /// Attributes
                TProductAttributes(),
                const SizedBox(
                  height: TSizes.spaceBtwSections,
                ),

                /// Checkout Button
                SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () {}, child: Text('Checkout'))),
                const SizedBox(
                  height: TSizes.spaceBtwSections,
                ),

                /// Description
                const TSectionHeading(
                  title: 'Description',
                  showActionButton: false,
                ),
                const SizedBox(
                  height: TSizes.spaceBtwItems,
                ),
                const SizedBox(
                  height: TSizes.spaceBtwSections,
                ),
                const ReadMoreText(
                  'This is a Product description for Blue Nike Sleeve less vest. There are more things that can added but',
                  trimLines: 2,
                  trimMode: TrimMode.Line,
                  trimCollapsedText: ' Show more',
                  trimExpandedText: ' Less',
                  moreStyle: TextStyle(
                      fontSize: 14, fontWeight: FontWeight.w800),
                  lessStyle: TextStyle(
                      fontSize: 14, fontWeight: FontWeight.w800),
                ),

                /// Reviews
                const Divider(),
                const SizedBox(
                  height: TSizes.spaceBtwItems,
                ),
                const SizedBox(
                  height: TSizes.spaceBtwSections,
                ),

                /// - Reviews
                IconButton(icon: const Icon(Iconsax.arrow_right_3, size: 18),
                  onPressed: () => Get.to(() => const ProductReviewsScreen()))
              ],
            ),
          )
        ],
      ),
    ));
  }
}
