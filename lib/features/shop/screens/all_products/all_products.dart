import 'package:e_store/common/widgets/appbar/appbar.dart';
import 'package:e_store/common/widgets/layouts/grid_layout.dart';
import 'package:e_store/common/widgets/products.cart/product_cards/product_card_vertical.dart';
import 'package:e_store/utils/constants/sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/widgets/products/sortable/sortable_products.dart';

class AllProducts extends StatelessWidget{
  const AllProducts({super.key});

  @override
  Widget build(BuildContext context)
  {

    return const Scaffold(
      ///Appbar
      appBar: const TAppBar(title: Text('Popular Products'), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(TSizes.defaultSpace),
            child: TSortableProducts(),
        )
      ),

    );
  }
}

