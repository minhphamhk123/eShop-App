import 'package:e_store/common/widgets/appbar/appbar.dart';
import 'package:e_store/common/widgets/layouts/grid_layout.dart';
import 'package:e_store/common/widgets/products.cart/product_cards/product_card_vertical.dart';
import 'package:e_store/utils/constants/sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class AllProducts extends StatelessWidget{
  const AllProducts({super.key});

  @override
  Widget build(BuildContext context)
  {

    return Scaffold(
      appBar: const TAppBar(title: Text('Popular Products'), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(TSizes.defaultSpace),
            child: Column(
              children: [
                ///Dropdown
                DropdownButtonFormField(
                    decoration: const InputDecoration(prefix: Icon(Iconsax.sort)),
                    onChanged: (value){},
                    items: ['Name','Higher Price','Lower Price','Sale','Newest','Popularity']
                        .map((option) => DropdownMenuItem(
                        value: option,
                        child: Text(option)))
                        .toList(),
                ),
                const SizedBox(height: TSizes.spaceBtwSections),
                ///Products
                TGridLayout(itemCount: 4, itemBuilder: (_, index) => const TProductCardVertical())
              ],
            )
        )
      ),

    );
  }
}