import 'package:e_store/common/widgets/appbar/appbar.dart';
import 'package:e_store/common/widgets/layouts/grid_layout.dart';
import 'package:e_store/common/widgets/products/sortable/sortable_products.dart';
import 'package:e_store/common/widgets/texts/section_heading.dart';
import 'package:e_store/utils/constants/sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AllBrandsScreen extends StatelessWidget{

  const AllBrandsScreen({super.key});

  @override
  Widget build(BuildContext context)
  {
    return const Scaffold(
      appBar: TAppBar(title: Text('Brand'), showBackArrow: true,),
      body: SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.all(TSizes.defaultSpace),
            child: Column(
              children: [
                /// Heading
                TSectionHeading(title: 'Brands'),
                SizedBox(height: TSizes.spaceBtwSections,),
                /// Brands
                /*TGridLayout(
                  itemCount: 10,
                  itemBuilder: (context, index) => TBrandCard(showBorder: true, onTap: () => Get.to(() => const BrandProducts() )
                ),*/
              ],
            ),
        ),
      ),
    );
  }
}