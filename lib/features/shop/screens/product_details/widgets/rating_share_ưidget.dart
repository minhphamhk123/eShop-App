import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constants/sizes.dart';
import '../../../models/product_model.dart';

class TRatingAndShare extends StatelessWidget {
  const TRatingAndShare({
    super.key, required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ///Ratting
        Row(
          children: [
            const Icon(Iconsax.star5, color: Colors.amber, size: 24,),
            const SizedBox(width: TSizes.spaceBtwItems / 2),
            Text.rich(
                TextSpan(
                    children: [
                      TextSpan(text: product.rating.toString(), style: Theme.of(context).textTheme.bodyLarge),
                      TextSpan(text: ' (${product.reviews?.length})'),
                    ]
                )
            ),
          ],
        ),

        /// Share button
        IconButton(onPressed: (){}, icon: const Icon(Icons.share, size: TSizes.iconMd,))
      ],

    );
  }
}
