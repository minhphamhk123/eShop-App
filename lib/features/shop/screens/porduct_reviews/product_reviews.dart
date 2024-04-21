import 'package:e_store/common/widgets/appbar/appbar.dart';
import 'package:e_store/features/shop/screens/porduct_reviews/widgets/rating_progess_indicator.dart';
import 'package:e_store/features/shop/screens/porduct_reviews/widgets/user_review_cart.dart';
import 'package:e_store/utils/constants/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../common/widgets/products/ratings/rating_indicator.dart';
import '../../../../utils/constants/sizes.dart';

class ProductReviewsScreen extends StatelessWidget {
  const ProductReviewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// -- Appbar
      appBar: const TAppBar(
        title: Text('Reviews & Ratings'),
        showBackArrow: true,
      ),

      /// -- Body
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                  "Ratings and reviews are verified and from people who use the same type of device that you use."),
              const SizedBox(height: TSizes.spaceBtwItems),

              /// Overall Product Ratings
              const TOverallProductRating(),
              const TRatingBarIndicator(rating: 3.5,),
              Text('12,611', style: Theme.of(context).textTheme.bodySmall),
              const SizedBox(height: TSizes.spaceBtwSections),

              /// User Reviews List
              const UserReviewCard(),
              const UserReviewCard(),
              const UserReviewCard(),
              const UserReviewCard(),
            ],
          ),
        ),
      ),
    );
  }
}

