
import 'package:e_store/widgets/custom_shapes/containers/circular_container.dart';
import 'package:e_store/widgets/custom_shapes/custom_shapes/curved_edges_widget.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';

class TPrimaryHeaderContainer extends StatelessWidget {
  const TPrimaryHeaderContainer({
    super.key, required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return TCurvedEdgeWidget(
      child: Container(
        color: TColors.primary,
        child: Stack(
          children: [
        Positioned(top: -150, right: -250, child: TCircularContainer(backgroundColor: TColors.textWhite)),
        Positioned(top: 100, right: -300, child: TCircularContainer(backgroundColor: TColors.textWhite)),
            child,
          ],
        ),
      ),
    );
  }
}

