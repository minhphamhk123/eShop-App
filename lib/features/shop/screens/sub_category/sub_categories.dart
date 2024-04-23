import 'package:e_store/common/widgets/appbar/appbar.dart';
import 'package:e_store/common/widgets/images/t_rounded_image.dart';
import 'package:e_store/common/widgets/texts/section_heading.dart';
import 'package:e_store/utils/constants/sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../../utils/constants/image_strings.dart';
import '../../../../common/widgets/products/product_cards/product_card_horizontal.dart';

class SubCategoriesScreen extends StatelessWidget{
  const SubCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: const TAppBar(title: Text('Sports shirts'),showBackArrow: true,),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              ///Banner
              const TRoundedImage(width: double.infinity, imageUrl: TImages.promoBanner1 /*thay bằng promoBanner4 sau do chưa có promoBanner4*/, applyImageRadius: true,),
              const SizedBox(height: TSizes.spaceBtwSections),
              ///Sub-Categories
              Column(
                children: [
                  ///Heading
                  TSectionHeading(title: 'Sport shirts',onPressed: (){},),
                  const SizedBox(height: TSizes.spaceBtwSections/2),
                  SizedBox(
                    height: 120,
                    child: ListView.separated(
                        itemCount: 4,
                        scrollDirection: Axis.horizontal,
                        separatorBuilder: (context, index) => const SizedBox(width: TSizes.spaceBtwItems),
                        itemBuilder: (context, index) => const TProductCardHorizontal()),
                  )
                ],
              )
            ],
          )
        )
      )
    );
  }
}