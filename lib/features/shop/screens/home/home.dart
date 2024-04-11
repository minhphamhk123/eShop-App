import 'package:e_store/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:e_store/section_heading.dart';
import 'package:flutter/material.dart';

import '../../../../common/widgets/custom_shapes/containers/primary_header_container.dart';
import '../../../../common/widgets/custom_shapes/containers/search_container.dart';
import '../../../../home_categories.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TPrimaryHeaderContainer(
                child: Column(
              children: [
                ///Header
                THomeAppBar(),
                SizedBox(height: 30),

                ///Searchbar

                TSearchContainer(text: 'Search in store'),
                SizedBox(height: 30),

                ///Categories
                Padding(
                    padding: EdgeInsets.only(left: 30),
                    child: Column(children: [
                      ///Heading
                      TSectionHeading(
                          title: 'Popular Categories',
                          showActionButton: false,
                          textColor: Colors.white),
                      SizedBox(height: 30),

                      ///Categories
                      THomeCategories(),
                    ]))
              ],
            )),
          ],
        ),
      ),
    );
  }
}
