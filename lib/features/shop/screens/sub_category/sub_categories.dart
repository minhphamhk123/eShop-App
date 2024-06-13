import 'package:e_store/common/widgets/appbar/appbar.dart';
import 'package:e_store/common/widgets/images/t_rounded_image.dart';
import 'package:e_store/common/widgets/texts/section_heading.dart';
import 'package:e_store/features/shop/controllers/product/product_controller.dart';
import 'package:e_store/features/shop/models/product_model.dart';
import 'package:e_store/utils/constants/sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../../../common/widgets/shimmers/vertical_product_shimmer.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../common/widgets/products/product_cards/product_card_horizontal.dart';

class SubCategoriesScreen extends StatelessWidget {
  const SubCategoriesScreen({super.key, required this.name});

  final String name;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProductController());
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.fetchProductsByCategory(name);
    });
    return Scaffold(
        appBar: TAppBar(
          title: Text(name),
          showBackArrow: true,
        ),
        body: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.all(TSizes.defaultSpace),
                child: Column(
                  children: [
                    ///Banner
                    const TRoundedImage(
                      width: double.infinity,
                      imageUrl: TImages
                          .promoBanner1 /*thay bằng promoBanner4 sau do chưa có promoBanner4*/,
                      applyImageRadius: true,
                    ),
                    const SizedBox(height: TSizes.spaceBtwSections),

                    ///Sub-Categories
                    Column(
                      children: [
                        ///Heading
                        TSectionHeading(
                          title: name,
                          onPressed: () {},
                        ),
                        const SizedBox(height: TSizes.spaceBtwSections / 2),
                        SizedBox(
                          height: 120,
                          child: Obx(() {
                            if (controller.isLoading.value) {
                              return const TVerticalProductShimmer();
                            }

                            if (controller.categoryProducts.isEmpty) {
                              return Center(child: Text('No products found in this category.'));
                            }
                            return ListView.separated(
                                itemCount: controller.categoryProducts.length,
                                scrollDirection: Axis.horizontal,
                                separatorBuilder: (context, index) =>
                                    const SizedBox(width: TSizes.spaceBtwItems),
                                itemBuilder: (context, index) =>
                                    TProductCardHorizontal(product: controller.categoryProducts[index]));
                          }),
                        )
                      ],
                    )
                  ],
                ))));
  }
}
