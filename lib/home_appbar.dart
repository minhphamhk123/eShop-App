import 'package:e_store/appbar.dart';
import 'package:e_store/cart_menu_icon.dart';
import 'package:e_store/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class THomeAppBar extends StatelessWidget {
  const THomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const TAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Good day for shopping",/*style: */ ),
          Text("UIT CNPM",/*style: */)
        ],
      ),
      actions: [
        TCartCounterIcon(iconColor: TColors.white)
      ]
    );
  }
}