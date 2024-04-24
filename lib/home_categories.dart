import 'package:e_store/features/shop/screens/sub_category/sub_categories.dart';
import 'package:e_store/utils/constants/image_strings.dart';
import 'package:e_store/vertical_image_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class THomeCategories extends StatelessWidget{
  const THomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context)
  {
    return SizedBox(
      height: 80,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 6,
        scrollDirection: Axis.horizontal,
        itemBuilder: (_,index){
          return TVerticalImageText(image: TImages.shoeIcon, title: 'Shoes Categories', onTap: () => Get.to(() => const SubCategoriesScreen()));
        },
      ),
    );
  }
}