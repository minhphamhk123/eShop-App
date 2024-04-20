import 'package:e_store/features/shop/screens/product_details/widgets/product_detail_image_slider.dart';
import 'package:e_store/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

import '../../../../utils/constants/sizes.dart';

class ProductDetailScreeen extends StatelessWidget {
  const ProductDetailScreeen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          /// 1 - Product Image Slider
          TProductImageSlider(dark: dark),

          /// 2 - Product Details
          Padding(
            padding: EdgeInsets.only(
                right: TSizes.defaultSpace,
                left: TSizes.defaultSpace,
                bottom: TSizes.defaultSpace),
            child: Column(

            ),
          )
        ],
      ),
    ));
  }
}
