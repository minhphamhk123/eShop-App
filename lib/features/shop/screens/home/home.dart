import 'package:e_store/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:e_store/features/shop/screens/home/widgets/promo_slider.dart';
import 'package:e_store/common/widgets/texts/section_heading.dart';
import 'package:e_store/utils/constants/image_strings.dart';
import 'package:e_store/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/custom_shapes/containers/primary_header_container.dart';
import '../../../../common/widgets/custom_shapes/containers/search_container.dart';
import '../../../../common/widgets/layouts/grid_layout.dart';
import '../../../../common/widgets/products/product_cards/product_card_vertical.dart';
import '../../../../home_categories.dart';
import '../../../../utils/constants/colors.dart';
import '../all_products/all_products.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const TPrimaryHeaderContainer(
                child: Column(
              children: [
                ///Header
                THomeAppBar(),
                SizedBox(height: TSizes.spaceBtwSections),

                ///Searchbar

                TSearchContainer(text: 'Search in store'),
                SizedBox(height: TSizes.spaceBtwSections),

                ///Categories
                Padding(
                    padding: EdgeInsets.only(left: 30),
                    child: Column(children: [
                      ///Heading
                      TSectionHeading(
                          title: 'Popular Categories',
                          showActionButton: false,
                          textColor: TColors.white),
                      SizedBox(height: TSizes.spaceBtwSections),
                    ])),

                ///Categories
                THomeCategories(),
                SizedBox(height: TSizes.spaceBtwSections)
              ],
            )),

            ///Body
            Padding(
                padding: const EdgeInsets.all(TSizes.defaultSpace),
                child: Column(
                  children: [
                    const TPromoSlider(
                      banners: [
                        TImages.promoBanner1,
                        TImages.promoBanner2,
                        TImages.promoBanner3
                      ],
                    ),
                    const SizedBox(
                      height: TSizes.spaceBtwSections,
                    ),

                    /// Heading
                    TSectionHeading(
                        title: 'Popular Products', onPressed: () => Get.to(() => const AllProducts())),
                    const SizedBox(height: TSizes.spaceBtwItems),

                    TGridLayout(
                      itemCount: 4,
                      itemBuilder: (_, index) => const TProductCardVertical(),
                    ),
                  ],
                ) //),
                )
          ],
        ),
      ),
    );
  }
}
