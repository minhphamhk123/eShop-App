import 'package:e_store/common/widgets/appbar/appbar.dart';
import 'package:e_store/common/widgets/appbar/tabbar.dart';
import 'package:e_store/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:e_store/common/widgets/layouts/grid_layout.dart';
import 'package:e_store/common/widgets/products.cart/cart_menu_icon.dart';
import 'package:e_store/features/shop/screens/store/widgets/category_tab.dart';
import 'package:e_store/section_heading.dart';
import 'package:e_store/utils/constants/image_strings.dart';
import 'package:e_store/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

import '../../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../../common/widgets/images/t_circular_image.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        /// -- Appbar -- Tutorial [Section # 3, Video 7]
        appBar: TAppBar(
          title:
              Text('Store', style: Theme.of(context).textTheme.headlineMedium),
          actions: [
            TCartCounterIcon(onPressed: (){})
          ],
        ),
        body: NestedScrollView(
            headerSliverBuilder: (_, innerBoxIsScrolled) {
              return [
                SliverAppBar(
                  automaticallyImplyLeading: false,
                  pinned: true,
                  floating: true,
                  backgroundColor: THelperFunctions.isDarkMode(context)
                      ? TColors.black
                      : TColors.white,
                  expandedHeight: 440,

                  flexibleSpace: Padding(
                    padding: const EdgeInsets.all(TSizes.defaultSpace),
                    child: ListView(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        /// -- Search bar
                        const SizedBox(height: TSizes.spaceBtwItems),
                        const TSearchContainer(
                          text: 'Search in Store',
                          showBorder: true,
                          showBackground: false,
                          padding: EdgeInsets.zero,
                        ),
                        const SizedBox(height: TSizes.spaceBtwSections),

                        /// -- Featured Brands
                        TSectionHeading(
                            title: 'Featured Brands', onPressed: () {}),
                        const SizedBox(height: TSizes.spaceBtwItems / 1.5),

                        /// -- Brands GRID
                        TGridLayout(
                            itemCount: 4,
                            mainAxisExtent: 80,
                            itemBuilder: (_, index) {
                              return GestureDetector(
                                onTap: () {},
                                child: TRoundedContainer(
                                    padding: const EdgeInsets.all(TSizes.sm),
                                    showBorder: true,
                                    backgroundColor: Colors.transparent,
                                    child: Row(
                                      children: [
                                        /// -- Icon
                                        Flexible(
                                          child: TCircularImage(
                                            isNetworkImage: false,
                                            image: TImages.clothIcon,
                                            backgroundColor: Colors.transparent,
                                            overlayColor:
                                                THelperFunctions.isDarkMode(
                                                        context)
                                                    ? TColors.white
                                                    : TColors.black,
                                          ),
                                        ),
                                        const SizedBox(
                                            width: TSizes.spaceBtwItems / 2),

                                        /// -- Text
                                        Expanded(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              // const TBrandTitleWithVerifiedIcon(title: 'Nike', brandTextSize: TextSizes.large),
                                              Text(
                                                '256 products',
                                                overflow: TextOverflow.ellipsis,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .labelMedium,
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    )),
                              );
                            })
                      ],
                    ),
                  ),

                  /// Tabs -- Tutorial [Section # 3, Video # 8]
                  bottom: const TTabBar(
                    tabs: [
                      Tab(child: Text('Sports')),
                      Tab(child: Text('Furniture')),
                      Tab(child: Text('Electronics')),
                      Tab(child: Text('Clothes')),
                      Tab(child: Text('Cosmetics')),
                    ],
                  ),
                )
              ];
            },

            /// --Body --Tutorial [Section # 3, Video # 8]
            body: const TabBarView(
              children: [
                TCategoryTab(),
                TCategoryTab(),
                TCategoryTab(),
                TCategoryTab(),
                TCategoryTab(),
              ],
            )),
      ),
    );
  }
}
