import 'package:e_store/common/widgets/appbar/appbar.dart';
import 'package:e_store/common/widgets/products.cart/cart_menu_icon.dart';
import 'package:flutter/material.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        title: Text('Store'),
        actions: [
          // TCartCounterIcon(onPressed: (){}),
        ],
      ),
    );
  }
}
