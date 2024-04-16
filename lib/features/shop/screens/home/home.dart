import 'package:e_store/common/widgets/products.cart/product_cards/product_card_vertical.dart';
import 'package:e_store/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:e_store/features/shop/screens/home/widgets/promo_slider.dart';
import 'package:e_store/section_heading.dart';
import 'package:e_store/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';

import '../../../../common/widgets/custom_shapes/containers/primary_header_container.dart';
import '../../../../common/widgets/custom_shapes/containers/search_container.dart';
import '../../../../common/widgets/layouts/grid_layout.dart';
import '../../../../home_categories.dart';
import '../../../../utils/constants/sizes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TPrimaryHeaderContainer(
                child: Column(
              children: [
                ///Header
                THomeAppBar(),
                SizedBox(height: 30),

                ///Searchbar

                TSearchContainer(text: 'Search in store'),
                SizedBox(height: 30),

                ///Categories
                Padding(
                    padding: EdgeInsets.only(left: 30),
                    child: Column(children: [
                      ///Heading
                      TSectionHeading(
                          title: 'Popular Categories',
                          showActionButton: false,
                          textColor: Colors.white),
                      SizedBox(height: 30),

                      ///Categories
                      THomeCategories(),
                    ]))
              ],
            )),

            ///Body
            Padding(
                padding: EdgeInsets.all(TSizes.defaultSpace),
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
                    TGridLayout(itemCount: 2, itemBuilder: (_, index) => const TProductCardVertical(),),
                  ],
                ) //),
                )
          ],
        ),
      ),
    );
  }
}

