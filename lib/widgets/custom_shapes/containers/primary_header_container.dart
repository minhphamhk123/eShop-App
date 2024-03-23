
import 'package:e_store/widgets/custom_shapes/containers/circular_container.dart';
import 'package:e_store/widgets/custom_shapes/custom_shapes/curved_edges_widget.dart';
import 'package:flutter/material.dart';

class TPrimaryHeaderContainer extends StatelessWidget {
  const TPrimaryHeaderContainer({
    super.key, required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return TCurvedEdgeWidget(
      child: Container(
            //color: TColor.primary,
            padding: const EdgeInsets.all(0),
            child: const SizedBox(
              height: 400,
              child: Stack(
    children: [
      Positioned(top: -150, right: -250, child: TCircularContainer(backgroundColor: Colors.white)),
      Positioned(top: 100, right: -300, child: TCircularContainer(backgroundColor: Colors.white))
    ],
              ),
            ),
          ),
    );
  }
}

