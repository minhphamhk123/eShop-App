import 'package:e_store/home_appbar.dart';
import 'package:e_store/home_categories.dart';
import 'package:e_store/section_heading.dart';
import 'package:e_store/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:e_store/widgets/custom_shapes/containers/search_container.dart';
import 'package:flutter/material.dart';

import 'utils/constants/sizes.dart';

class HomeScreen extends StatelessWidget{
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context)
  {
    return const  Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TPrimaryHeaderContainer(
              child: Column(
                children: [
                  ///Header

                  THomeAppBar(),
                  SizedBox(height: TSizes.spaceBtwSections),
                  ///Searchbar

                  TSearchContainer(text: 'Search in store'),
                  SizedBox(height: TSizes.spaceBtwSections),

                  ///Categories
                  Padding(
                    padding:  EdgeInsets.only(left: TSizes.defaultSpace),
                    child: Column(
                      children:[
                        ///Heading
                        TSectionHeading(title: 'Popular Categories',showActionButton: false,textColor: Colors.white),
                        SizedBox(height: 30),
                        ///Categories
                        THomeCategories(),
                      ]
                    ),
                  ),
                  SizedBox(height: TSizes.spaceBtwSections),
                ],)
            ),
          ],
          ),
          ),
    );
    
  }
}



