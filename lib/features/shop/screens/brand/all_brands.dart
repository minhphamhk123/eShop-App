import 'package:e_store/common/widgets/appbar/appbar.dart';
import 'package:e_store/common/widgets/layouts/grid_layout.dart';
import 'package:e_store/common/widgets/texts/section_heading.dart';
import 'package:e_store/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../../../common/widgets/brands/brand_card.dart';
import 'brand_products.dart';

class AllBrandsScreen extends StatelessWidget{

  const AllBrandsScreen({super.key});

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: const TAppBar(title: Text('Brand'), showBackArrow: true,),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(TSizes.defaultSpace),
            child: Column(
              children: [
                /// Heading
                const TSectionHeading(title: 'Brands'),
                const SizedBox(height: TSizes.spaceBtwSections,),
                /// Brands
                TGridLayout(
                  itemCount: 10,
                  itemBuilder: (context, index) => TBrandCard(showBorder: true, onTap: () => Get.to(() => const BrandProducts())),
                ),
              ],
            ),
        ),
      ),
    );
  }
}