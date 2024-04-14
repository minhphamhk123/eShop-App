import 'package:e_store/appbar.dart';
import 'package:e_store/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../home.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: TAppBar(
        title: Text('Wishlist'/* style:  */),
        actions: [
          //TCircularIcon(icon: Iconsax.add, onPressed: () => Get.to(const HomeScreen())),
        ]
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            //children: [TGridLayout(itemCount: 6, itemBuilder:(_, index) => const TProductCardVertical())],
          ),
        )
      )
    );
  }
}