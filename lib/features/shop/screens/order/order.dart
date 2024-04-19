import 'package:e_store/common/widgets/appbar/appbar.dart';
import 'package:e_store/features/shop/screens/order/widgets/orders_list.dart';
import 'package:e_store/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      ///Appbar
      appBar: TAppBar(title: Text('My Orders', style: Theme.of(context).textTheme.headlineSmall)),
      body: const Padding(
        padding: EdgeInsets.all(TSizes.defaultSpace),

      ///Orders
        child: TOrderListItems(),
      ),
    );
  }
}
