import 'package:e_store/common/widgets/layouts/grid_layout.dart';
import 'package:e_store/common/widgets/texts/section_heading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/widgets/brands/brand_show_case.dart';
import '../../../../../common/widgets/products/product_cards/product_card_vertical.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../all_products/all_products.dart';

class TCategoryTab extends StatelessWidget {
  const TCategoryTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              /// -- Brands
              const TBrandShowcase(images: [TImages.productImage3, TImages.productImage3, TImages.productImage3]),
              const TBrandShowcase(images: [TImages.productImage3, TImages.productImage3, TImages.productImage3]),
              const SizedBox(height: TSizes.spaceBtwItems,),

              /// Products
              TSectionHeading(title: 'You might like', onPressed: () => Get.to(() => const AllProducts())),
              const SizedBox(height: TSizes.spaceBtwItems),

              TGridLayout(itemCount: 4, itemBuilder: (_, index) => const TProductCardVertical())
            ],
          ),
        ),
      ],
    );
  }
}
